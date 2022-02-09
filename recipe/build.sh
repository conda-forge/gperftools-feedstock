#!/bin/bash

set -ex

if [[ $(uname) == Darwin ]]; then
  export MACOSX_DEPLOYMENT_TARGET="10.9"
  export CFLAGS="$CFLAGS -D_XOPEN_SOURCE"

  autoreconf -fiv
  ./configure  --prefix $PREFIX \
    CC=clang \
    CXX=clang++ \
    --disable-debugalloc \
    --disable-dependency-tracking \
    --disable-libunwind
  make
  make install
else
  ./autogen.sh
  ./configure  --prefix $PREFIX --enable-libunwind
  make
  make check
  make install
fi
