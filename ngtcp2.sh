#!/bin/sh

# Copyright 2014-present Viktor Szakats. See LICENSE.md

# shellcheck disable=SC3040
set -o xtrace -o errexit -o nounset; [ -n "${BASH:-}${ZSH_NAME:-}" ] && set -o pipefail

export _NAM _VER _OUT _BAS _DST

_NAM="$(basename "$0" | cut -f 1 -d '.')"
_VER="$1"

(
  cd "${_NAM}" || exit 0

  rm -r -f "${_PKGDIR}" "${_BLDDIR}"

  CPPFLAGS='-DNDEBUG'
  options=''

  if [ "${_OPENSSL}" = 'boringssl' ]; then
    options="${options} -DENABLE_OPENSSL=OFF"
    options="${options} -DENABLE_BORINGSSL=ON"
    options="${options} -DBORINGSSL_INCLUDE_DIR=${_TOP}/boringssl/${_PP}/include"
    options="${options} -DBORINGSSL_LIBRARIES=${_TOP}/boringssl/${_PP}/lib/libcrypto.a;${_TOP}/boringssl/${_PP}/lib/libssl.a;-lpthread;-lws2_32"
    CPPFLAGS="${CPPFLAGS} -DNOCRYPT"
  elif [ "${_OPENSSL}" = 'openssl-quic' ]; then
    options="${options} -DENABLE_OPENSSL=ON"
    options="${options} -DOPENSSL_ROOT_DIR=../openssl-quic/${_PP}"
    options="${options} -DOPENSSL_INCLUDE_DIR=../openssl-quic/${_PP}/include"
  fi

  if [ -d ../nghttp3 ]; then
    options="${options} -DLIBNGHTTP3_LIBRARY=../nghttp3/${_PP}/lib"
    options="${options} -DLIBNGHTTP3_INCLUDE_DIR=../nghttp3/${_PP}/include"
  fi

  # shellcheck disable=SC2086
  cmake . -B "${_BLDDIR}" ${_CMAKE_GLOBAL} ${_CMAKE_CXX_GLOBAL} ${options} \
    '-DENABLE_STATIC_LIB=ON' \
    '-DENABLE_SHARED_LIB=OFF' \
    "-DCMAKE_C_FLAGS=-Wno-unused-command-line-argument ${_CFLAGS_GLOBAL} ${_CPPFLAGS_GLOBAL} ${CPPFLAGS} ${_LDFLAGS_GLOBAL} ${_LIBS_GLOBAL}" \
    "-DCMAKE_CXX_FLAGS=-Wno-unused-command-line-argument ${_CFLAGS_GLOBAL} ${_CPPFLAGS_GLOBAL} ${CPPFLAGS} ${_LDFLAGS_GLOBAL} ${_LIBS_GLOBAL} ${_CXXFLAGS_GLOBAL} ${_LDFLAGS_CXX_GLOBAL}"

  make --directory="${_BLDDIR}" --jobs="${_JOBS}" install "DESTDIR=$(pwd)/${_PKGDIR}"

  _pkg="${_PP}"  # DESTDIR= + _PREFIX

  # Delete '_static' suffixes from static lib names to make these behave
  # like most other projects do and dependents find it.
  for fn in "${_pkg}"/lib/*_static.a; do
    mv "${fn}" "$(echo "${fn}" | sed 's/_static//')"
  done

  # Delete .pc files
  rm -r -f "${_pkg}"/lib/pkgconfig

  # Make steps for determinism

  readonly _ref='ChangeLog'

  "${_STRIP}" --enable-deterministic-archives --strip-debug "${_pkg}"/lib/*.a

  touch -c -r "${_ref}" "${_pkg}"/include/ngtcp2/*.h
  touch -c -r "${_ref}" "${_pkg}"/lib/*.a

  # Create package

  _OUT="${_NAM}-${_VER}${_REVSUFFIX}${_PKGSUFFIX}"
  _BAS="${_NAM}-${_VER}${_PKGSUFFIX}"
  _DST="$(mktemp -d)/${_BAS}"

  mkdir -p "${_DST}/include/ngtcp2"
  mkdir -p "${_DST}/lib"

  cp -f -p "${_pkg}"/include/ngtcp2/*.h "${_DST}/include/ngtcp2/"
  cp -f -p "${_pkg}"/lib/*.a            "${_DST}/lib/"
  cp -f -p ChangeLog                    "${_DST}/ChangeLog.txt"
  cp -f -p AUTHORS                      "${_DST}/AUTHORS.txt"
  cp -f -p COPYING                      "${_DST}/COPYING.txt"
  cp -f -p README.rst                   "${_DST}/"

  ../_pkg.sh "$(pwd)/${_ref}"
)
