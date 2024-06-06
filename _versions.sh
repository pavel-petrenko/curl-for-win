#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

export DOCKER_IMAGE='debian:testing-20240513-slim'

export CURL_VER_='8.8.0'
export CURL_HASH=0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd08791d12551d4400
# Create revision string
# NOTE: Set _REV to 1 after bumping CURL_VER_, then increment for each
#       CI rebuild via `main` branch push (e.g. after bumping a dependency).
export _REV="${CW_REVISION:-1}"

export TRURL_VER_='0.13'
export TRURL_HASH=8ceeb09d0e08dc677897f26651aa625d9ad18021f881f9d5f31e5a95bb3cc047

export CACERT_VER_='2024-03-11'
export CACERT_HASH=1794c1d4f7055b7d02c2170337b61b48a2ef6c90d77e95444fd2596f4cac609f
export BROTLI_VER_='1.1.0'
export BROTLI_HASH=e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff
export CARES_VER_='1.29.0'
export CARES_HASH=0b89fa425b825c4c7bc708494f374ae69340e4d1fdc64523bdbb2750bfc02ea7
export LIBPSL_VER_='0.21.5'
export LIBPSL_HASH=1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
export LIBSSH_VER_='0.10.6'
export LIBSSH_HASH=1861d498f5b6f1741b6abc73e608478491edcf9c9d4b6630eef6e74596de9dc1
export LIBSSH2_VER_='1.11.0'
export LIBSSH2_HASH=a488a22625296342ddae862de1d59633e6d446eff8417398e06674a49be3d7c2
export LIBSSH2_CPPFLAGS='-DLIBSSH2_NO_DSA -DLIBSSH2_NO_BLOWFISH -DLIBSSH2_NO_RC4 -DLIBSSH2_NO_HMAC_RIPEMD -DLIBSSH2_NO_CAST -DLIBSSH2_NO_3DES -DLIBSSH2_NO_MD5'
export NGHTTP2_VER_='1.62.1'
export NGHTTP2_HASH=2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72
export NGHTTP3_VER_='1.3.0'
export NGHTTP3_HASH=450525981d302f23832b18edd1a62cf58019392ca6402408d0eb1a7f3fd92ecf
export NGTCP2_VER_='1.5.0'
export NGTCP2_HASH=2a40368cbe6313d6029b7d06dbf179e9ba92c8d5b1c7411f91093ae943db857f
export QUICTLS_VER_='3.1.5'
export QUICTLS_HASH=a9d261a0a85d141052534aac3f67872093e37c004255eb4288df52f3beaf6e6f
export OPENSSL_VER_='3.3.1'
export OPENSSL_HASH=777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e
export BORINGSSL_VER_='2db0eb3f96a5756298dcd7f9319e56a98585bd10'
export BORINGSSL_HASH=cd240bf27450f75cd5f41c512a06297c00646cdbac9f87b604e9312771db15a6
export LIBRESSL_VER_='3.9.2'
export LIBRESSL_HASH=7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97
export OSSLSIGNCODE_VER_='2.8.0'
export OSSLSIGNCODE_HASH=d275d86bf0a8094e2c2ea451065299f965238be3cfaf3af6aff276302d759354
export ZLIBNG_VER_='2.1.6'
export ZLIBNG_HASH=a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2
export ZLIB_VER_='1.3.1'
export ZLIB_HASH=38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32
export ZSTD_VER_='1.5.6'
export ZSTD_HASH=8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1
export LLVM_MINGW_LINUX_AARCH64_VER_='20240606'
export LLVM_MINGW_LINUX_AARCH64_HASH=caea5b6415930054d0a48a6415d114e83d4907f4d2113ef66c335bd83e987a90
export LLVM_MINGW_LINUX_X86_64_VER_='20240606'
export LLVM_MINGW_LINUX_X86_64_HASH=9470422f05cbb5685dc301e02a63eb0e346d20d48da1b380942e42a35e9c4252
export LLVM_MINGW_MAC_VER_='20240606'
export LLVM_MINGW_MAC_HASH=efa50e55caf9de917d27afd6b0158139f5b11f78d366c7fdbf2128c46f6cbc22
export LLVM_MINGW_WIN_VER_='20240606'
export LLVM_MINGW_WIN_HASH=388a876f904314ccaa28b5993de6aff8496488f170b9f6d291a9d66067a13acc
