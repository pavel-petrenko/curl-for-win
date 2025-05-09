#!/bin/sh

# Copyright (C) Viktor Szakats. See LICENSE.md
# SPDX-License-Identifier: MIT

export DOCKER_IMAGE='debian:testing-20250407-slim'
export DOCKER_CONTENT_TRUST='1'

export CURL_VER_='8.13.0'
export CURL_HASH=4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025
# Create revision string
# NOTE: Set _REV to 1 after bumping CURL_VER_, then increment for each
#       CI rebuild via `main` branch push (e.g. after bumping a dependency).
export _REV="${CW_REVISION:-1}"

export TRURL_VER_='0.16'
export TRURL_HASH=2c26e3016f591f06234838bbe1dd4b165dce2c871c82ca6a32222d19696588d6

export CACERT_VER_='2025-02-25'
export CACERT_HASH=50a6277ec69113f00c5fd45f09e8b97a4b3e32daa35d3a95ab30137a55386cef
export BROTLI_VER_='1.1.0'
export BROTLI_HASH=e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff
export CARES_VER_='1.34.5'
export CARES_HASH=7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346
export LIBPSL_VER_='0.21.5'
export LIBPSL_HASH=1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
export LIBSSH_VER_='0.11.1'
export LIBSSH_HASH=14b7dcc72e91e08151c58b981a7b570ab2663f630e7d2837645d5a9c612c1b79
export LIBSSH2_VER_='1.11.1'
export LIBSSH2_HASH=9954cb54c4f548198a7cbebad248bdc87dd64bd26185708a294b2b50771e3769
export LIBSSH2_CPPFLAGS='-DLIBSSH2_NO_BLOWFISH -DLIBSSH2_NO_RC4 -DLIBSSH2_NO_HMAC_RIPEMD -DLIBSSH2_NO_CAST -DLIBSSH2_NO_3DES -DLIBSSH2_NO_MD5'
export NGHTTP2_VER_='1.65.0'
export NGHTTP2_HASH=f1b9df5f02e9942b31247e3d415483553bc4ac501c87aa39340b6d19c92a9331
export NGHTTP3_VER_='1.8.0'
export NGHTTP3_HASH=a9dd28970977e6802a3eaf2cfaeae6d0fae60c8d2c0f2c4ce600036a7998ee9a
export NGTCP2_VER_='1.11.0'
export NGTCP2_HASH=382c15bf66b630f26021631b25b7eb1feac42c67c1d6826189d61091dfaa4d09
export QUICTLS_VER_='3.3.0'
export QUICTLS_HASH=392b6784ca12b9f068582212a9498366ffd3dd1bafe79507046bdd1a6a138cc9
export OPENSSL_VER_='3.5.0'
export OPENSSL_HASH=344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0
export BORINGSSL_VER_='0.20250311.0'
export BORINGSSL_HASH=ef73e453c2f60f37a8f1d30e0458da76ed6695f44768fb20067624205b076df6
export AWSLC_VER_='1.49.1'
export AWSLC_HASH=2fa2e31efab7220b2e0aac581fc6d4f2a6e0e16a26b9e6037f5f137d5e57b4df
export LIBRESSL_VER_='4.0.0'
export LIBRESSL_HASH=4d841955f0acc3dfc71d0e3dd35f283af461222350e26843fea9731c0246a1e4
export OSSLSIGNCODE_VER_='2.9.0'
export OSSLSIGNCODE_HASH=3fe5488e442ad99f91410efeb7b029275366b5df9aa02371dcc89a8f8569ff55
export ZLIBNG_VER_='2.2.4'
export ZLIBNG_HASH=a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3
export ZLIB_VER_='1.3.1'
export ZLIB_HASH=38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32
export ZSTD_VER_='1.5.7'
export ZSTD_HASH=eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3
export LLVM_MINGW_LINUX_AARCH64_VER_='20250402'
export LLVM_MINGW_LINUX_AARCH64_HASH=1fc4657db23b9a110b33714157618dbd60c5194d3d52359a883b119f7696b829
export LLVM_MINGW_LINUX_X86_64_VER_='20250402'
export LLVM_MINGW_LINUX_X86_64_HASH=a23248baa1447df94ed14dce07997ab01da45bda74ac5370bbd098ed1c56a362
export LLVM_MINGW_MAC_VER_='20250402'
export LLVM_MINGW_MAC_HASH=f530e1b3fdee6c0d89243b998c59d5559e06b0ac01e6e5abcfb5f2b7af5d7cea
export LLVM_MINGW_WIN_VER_='20250402'
export LLVM_MINGW_WIN_HASH=4edc13d878b4ec49c2f1a6e9161abb093bbaefc8b7d129f3b3f57a22a4a41d38
