#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

export DOCKER_IMAGE='debian:testing-20240330-slim'

export CURL_VER_='8.7.1'
export CURL_HASH=6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd
# Create revision string
# NOTE: Set _REV to 1 after bumping CURL_VER_, then increment for each
#       CI rebuild via `main` branch push (e.g. after bumping a dependency).
export _REV="${CW_REVISION:-7}"

export TRURL_VER_='0.10'
export TRURL_HASH=e54ee05a1a39f2547fbb39225f9cf5e2608eeaf07ad3f7dbff0a069d060d3c46

export CACERT_VER_='2024-03-11'
export CACERT_HASH=1794c1d4f7055b7d02c2170337b61b48a2ef6c90d77e95444fd2596f4cac609f
export BROTLI_VER_='1.1.0'
export BROTLI_HASH=e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff
export CARES_VER_='1.28.1'
export CARES_HASH=675a69fc54ddbf42e6830bc671eeb6cd89eeca43828eb413243fd2c0a760809d
export LIBPSL_VER_='0.21.5'
export LIBPSL_HASH=1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
export LIBSSH_VER_='0.10.6'
export LIBSSH_HASH=1861d498f5b6f1741b6abc73e608478491edcf9c9d4b6630eef6e74596de9dc1
export LIBSSH2_VER_='1.11.0'
export LIBSSH2_HASH=a488a22625296342ddae862de1d59633e6d446eff8417398e06674a49be3d7c2
export LIBSSH2_CPPFLAGS='-DLIBSSH2_NO_DSA -DLIBSSH2_NO_BLOWFISH -DLIBSSH2_NO_RC4 -DLIBSSH2_NO_HMAC_RIPEMD -DLIBSSH2_NO_CAST -DLIBSSH2_NO_3DES -DLIBSSH2_NO_MD5'
export NGHTTP2_VER_='1.61.0'
export NGHTTP2_HASH=c0e660175b9dc429f11d25b9507a834fb752eea9135ab420bb7cb7e9dbcc9654
export NGHTTP3_VER_='1.2.0'
export NGHTTP3_HASH=d2e216bae7bd7362f850922e4237a5caa204853b3594b22adccab4c1e1c1d1aa
export NGTCP2_VER_='1.4.0'
export NGTCP2_HASH=b5d1433b9f5c06ce249e1e390e97dcfa49bf7ada5cb7c8bed8e6cd4feaf1ca4a
export QUICTLS_VER_='3.1.5'
export QUICTLS_HASH=a9d261a0a85d141052534aac3f67872093e37c004255eb4288df52f3beaf6e6f
export OPENSSL_VER_='3.2.1'
export OPENSSL_HASH=83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39
export BORINGSSL_VER_='368d0d87d0bd00f8227f74ce18e8e4384eaf6afa'
export BORINGSSL_HASH=c699051e0944aab068f396e0c6161171bc5ae321a3fbc1f1b5cff7d1448f6d84
export LIBRESSL_VER_='3.9.1'
export LIBRESSL_HASH=6da0b954695f7ee62b03f64200a8a4f02af93717b60cce04ab6c8df262c07a51
export ZLIBNG_VER_='2.1.6'
export ZLIBNG_HASH=a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2
export ZLIB_VER_='1.3.1'
export ZLIB_HASH=38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32
export ZSTD_VER_='1.5.6'
export ZSTD_HASH=8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1
export LLVM_MINGW_LINUX_AARCH64_VER_='20240320'
export LLVM_MINGW_LINUX_AARCH64_HASH=85f62dffa67a1713a67743397b91e84446bbc08b6a2a3844e1a9aec7199abb16
export LLVM_MINGW_LINUX_X86_64_VER_='20240320'
export LLVM_MINGW_LINUX_X86_64_HASH=45461bc1634fda1d1ceaa09a476a3a279454d4e237c2d1723787c9be66e57141
export LLVM_MINGW_MAC_VER_='20240320'
export LLVM_MINGW_MAC_HASH=0ff98ffbf70e6c5785d5db96ef916c4ed6eb9b95fd739b5d03fac81c2a366024
export LLVM_MINGW_WIN_VER_='20240320'
export LLVM_MINGW_WIN_HASH=44e768d7dd94433b77ba00bf303e94881c1f075e0431cafc2424d8ed4b705e38
