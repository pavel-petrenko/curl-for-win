#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

export DOCKER_IMAGE='debian:testing-20250203-slim'
export DOCKER_CONTENT_TRUST='1'

export CURL_VER_='8.12.1'
export CURL_HASH=0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202
# Create revision string
# NOTE: Set _REV to 1 after bumping CURL_VER_, then increment for each
#       CI rebuild via `main` branch push (e.g. after bumping a dependency).
export _REV="${CW_REVISION:-1}"

export TRURL_VER_='0.16'
export TRURL_HASH=2c26e3016f591f06234838bbe1dd4b165dce2c871c82ca6a32222d19696588d6

export CACERT_VER_='2024-12-31'
export CACERT_HASH=a3f328c21e39ddd1f2be1cea43ac0dec819eaa20a90425d7da901a11531b3aa5
export BROTLI_VER_='1.1.0'
export BROTLI_HASH=e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff
export CARES_VER_='1.34.4'
export CARES_HASH=fa38dbed659ee4cc5a32df5e27deda575fa6852c79a72ba1af85de35a6ae222f
export LIBPSL_VER_='0.21.5'
export LIBPSL_HASH=1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
export LIBSSH_VER_='0.11.1'
export LIBSSH_HASH=14b7dcc72e91e08151c58b981a7b570ab2663f630e7d2837645d5a9c612c1b79
export LIBSSH2_VER_='1.11.1'
export LIBSSH2_HASH=9954cb54c4f548198a7cbebad248bdc87dd64bd26185708a294b2b50771e3769
export LIBSSH2_CPPFLAGS='-DLIBSSH2_NO_BLOWFISH -DLIBSSH2_NO_RC4 -DLIBSSH2_NO_HMAC_RIPEMD -DLIBSSH2_NO_CAST -DLIBSSH2_NO_3DES -DLIBSSH2_NO_MD5'
export NGHTTP2_VER_='1.64.0'
export NGHTTP2_HASH=88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd
export NGHTTP3_VER_='1.7.0'
export NGHTTP3_HASH=b4eb6bceb99293d9a9df2031c1aad166af3d57b3e33655aca0699397b6f0d751
export NGTCP2_VER_='1.10.0'
export NGTCP2_HASH=4f8dc1d61957205d01c3d6aa6f1c96c7b2bac1feea71fdaf972d86db5f6465df
export QUICTLS_VER_='3.3.0'
export QUICTLS_HASH=392b6784ca12b9f068582212a9498366ffd3dd1bafe79507046bdd1a6a138cc9
export OPENSSL_VER_='3.4.1'
export OPENSSL_HASH=002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3
export BORINGSSL_VER_='0.20250212.0'
export BORINGSSL_HASH=bb8ed99fcafa7de27b5880e6f2aefb8155575f3e623e8de5ddd5390ac06a5458
export AWSLC_VER_='1.45.0'
export AWSLC_HASH=b136d4331583e16dbcb0c501d56e80afbe5ea1314a4a1c89056953d76e37e9fc
export LIBRESSL_VER_='4.0.0'
export LIBRESSL_HASH=4d841955f0acc3dfc71d0e3dd35f283af461222350e26843fea9731c0246a1e4
export OSSLSIGNCODE_VER_='2.9.0'
export OSSLSIGNCODE_HASH=3fe5488e442ad99f91410efeb7b029275366b5df9aa02371dcc89a8f8569ff55
export ZLIBNG_VER_='2.2.4'
export ZLIBNG_HASH=a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3
export ZLIB_VER_='1.3.1'
export ZLIB_HASH=38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32
export ZSTD_VER_='1.5.6'
export ZSTD_HASH=8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1
export LLVM_MINGW_LINUX_AARCH64_VER_='20250114'
export LLVM_MINGW_LINUX_AARCH64_HASH=3b7b675a17189621700b5796d745db0aea6e29756870352390112101ad38afff
export LLVM_MINGW_LINUX_X86_64_VER_='20250114'
export LLVM_MINGW_LINUX_X86_64_HASH=a16f52dee819797248e6c7d63b8b1e50a92119f45767ecd8e9633d1733b896e2
export LLVM_MINGW_MAC_VER_='20250114'
export LLVM_MINGW_MAC_HASH=80b2e7ade71ba2dfe9e8d27fe47ae5738b1fb8d34e057faa2beef3070392f2d6
export LLVM_MINGW_WIN_VER_='20250114'
export LLVM_MINGW_WIN_HASH=9395d95c089611e6cd728c9a07219ffc5ac706e0c719833a2f7e64a706a81541
