#!/bin/sh

# Copyright 2014-present Viktor Szakats. See LICENSE.md

# shellcheck disable=SC3040
set -o xtrace -o errexit -o nounset; [ -n "${BASH:-}${ZSH_NAME:-}" ] && set -o pipefail

export _NAM
export _VER
export _OUT
export _BAS
export _DST

_NAM="$(basename "$0")"
_NAM="$(echo "${_NAM}" | cut -f 1 -d '.')"
_VER="$1"

(
  cd "${_NAM}" || exit 0

  [ "${_OS}" != 'win' ] && options="--build=${_CROSS_HOST} --host=${_TRIPLET}"

  # Build

  rm -r -f pkg

  # Skip building tests
  sed -i.bak 's| tests||g' ./Makefile.am

  # To fix this bizarre error when executing 'make':
  #   configure.ac:39: error: version mismatch.  This is Automake 1.16.4,
  #   configure.ac:39: but the definition used by this AM_INIT_AUTOMAKE
  #   configure.ac:39: comes from Automake 1.16.3.  You should recreate
  #   configure.ac:39: aclocal.m4 with aclocal and run automake again.
  #   [...]
  # Requires: autopoint (sometimes offered by the gettext package)
  [ -f 'Makefile' ] || autoreconf --force --install

  export LDFLAGS="${_OPTM}"
  export CFLAGS='-fno-ident -O3 -fno-builtin -fno-strict-aliasing -Wall -DHAVE_DECL_SECUREZEROMEMORY=1'
  ldonly=''

  if [ "${CC}" = 'mingw-clang' ]; then
    export CC='clang'
    if [ "${_OS}" != 'win' ]; then
      options="${options} --target=${_TRIPLET} --with-sysroot=${_SYSROOT}"
      LDFLAGS="${LDFLAGS} -target ${_TRIPLET} --sysroot ${_SYSROOT}"
      [ "${_OS}" = 'linux' ] && ldonly="${ldonly} -L$(find "/usr/lib/gcc/${_TRIPLET}" -name '*posix' | head -n 1)"
    fi
    export AR="${_CCPREFIX}ar"
    export NM="${_CCPREFIX}nm"
    export RANLIB="${_CCPREFIX}ranlib"
  else
    export CC="${_CCPREFIX}gcc -static-libgcc"
  fi

  CFLAGS="${LDFLAGS} ${CFLAGS}"
  LDFLAGS="${LDFLAGS}${ldonly}"
  [ "${_CPU}" = 'x86' ] && CFLAGS="${CFLAGS} -fno-asynchronous-unwind-tables"

  # NOTE: root path with spaces will break all value with 'realpath'. But,
  #       autotools breaks on spaces anyway, so let us leave it like that.

  options="${options} --with-libz"
  # These seem to work better than --with-libz-prefix=:
  CFLAGS="${CFLAGS} -I$(realpath ../zlib/pkg/usr/local/include)"
  LDFLAGS="${LDFLAGS} -L$(realpath ../zlib/pkg/usr/local/lib)"

  if [ -d ../libressl ]; then
    options="${options} --with-crypto=openssl --with-libssl-prefix=$(realpath ../libressl/pkg/C:/Windows/libressl)"
    CFLAGS="${CFLAGS} -DHAVE_EVP_AES_128_CTR=1 -DNOCRYPT"
  elif [ -d ../openssl_quic ]; then
    options="${options} --with-crypto=openssl --with-libssl-prefix=$(realpath ../openssl_quic/pkg/C:/Windows/System32/OpenSSL)"
    CFLAGS="${CFLAGS} -DHAVE_EVP_AES_128_CTR=1 -DOPENSSL_SUPPRESS_DEPRECATED"
    # Workaround for renamed directory in OpenSSL 3.x:
    [ "${_CPU}" = 'x64' ] && LDFLAGS="${LDFLAGS} -L$(realpath ../openssl_quic/pkg/C:/Windows/System32/OpenSSL)/lib64"
  elif [ -d ../openssl ]; then
    options="${options} --with-crypto=openssl --with-libssl-prefix=$(realpath ../openssl/pkg/C:/Windows/System32/OpenSSL)"
    CFLAGS="${CFLAGS} -DHAVE_EVP_AES_128_CTR=1 -DOPENSSL_SUPPRESS_DEPRECATED"
    # Workaround for renamed directory in OpenSSL 3.x:
    [ "${_CPU}" = 'x64' ] && LDFLAGS="${LDFLAGS} -L$(realpath ../openssl/pkg/C:/Windows/System32/OpenSSL)/lib64"
  else
    options="${options} --with-crypto=wincng"
  fi

  # shellcheck disable=SC2086
  ./configure ${options} \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --disable-rpath \
    --disable-debug \
    --enable-hidden-symbols \
    --enable-static \
    --disable-shared \
    --disable-examples-build \
    --prefix=/usr/local \
    --silent
  make --jobs 2 clean >/dev/null
  make --jobs 2 install "DESTDIR=$(pwd)/pkg" # >/dev/null # V=1

  # DESTDIR= + --prefix=
  _pkg='pkg/usr/local'

  # Build fixups for clang

  # 'configure' misdetects CC=clang as MSVC and then uses '.lib'
  # extension. Rename these to '.a':
  if [ -f "${_pkg}/lib/libssh2.lib" ]; then
    sed -i.bak "s|\.lib'$|.a'|g" "${_pkg}/lib/libssh2.la"
    mv "${_pkg}/lib/libssh2.lib" "${_pkg}/lib/libssh2.a"
  fi

  # Make steps for determinism

  readonly _ref='NEWS'

  "${_CCPREFIX}strip" --preserve-dates --strip-debug --enable-deterministic-archives ${_pkg}/lib/*.a

  touch -c -r "${_ref}" ${_pkg}/lib/*.a
  touch -c -r "${_ref}" ${_pkg}/lib/pkgconfig/*.pc
  touch -c -r "${_ref}" ${_pkg}/include/*.h

  # Create package

  _OUT="${_NAM}-${_VER}${_REVSUFFIX}${_PKGSUFFIX}"
  _BAS="${_NAM}-${_VER}${_PKGSUFFIX}"
  _DST="$(mktemp -d)/${_BAS}"

  mkdir -p "${_DST}/docs"
  mkdir -p "${_DST}/include"
  mkdir -p "${_DST}/lib/pkgconfig"

  (
    set +x
    for file in docs/*; do
      if [ -f "${file}" ] && echo "${file}" | grep -q -a -v -F '.'; then
        cp -f -p "${file}" "${_DST}/${file}.txt"
      fi
    done
  )
  cp -f -p ${_pkg}/lib/*.a            "${_DST}/lib/"
  cp -f -p ${_pkg}/lib/pkgconfig/*.pc "${_DST}/lib/pkgconfig/"
  cp -f -p ${_pkg}/include/*.h        "${_DST}/include/"
  cp -f -p NEWS                       "${_DST}/NEWS.txt"
  cp -f -p COPYING                    "${_DST}/COPYING.txt"
  cp -f -p README                     "${_DST}/README.txt"
  cp -f -p RELEASE-NOTES              "${_DST}/RELEASE-NOTES.txt"

  ../_pkg.sh "$(pwd)/${_ref}"
)
