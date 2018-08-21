#!/bin/bash

if [ $(uname) == Darwin ]; then
  export MACOSX_DEPLOYMENT_TARGET="10.9"
  # ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
  export CFLAGS="$CFLAGS -D_XOPEN_SOURCE"
  
  autoreconf -fiv
  ./configure  --prefix $PREFIX \
    CC=clang CXX=clang++ --disable-debugalloc \
    --disable-dependency-tracking
else
  ./autogen.sh
  ./configure  --prefix $PREFIX --enable-libunwind
fi

make
make check
make install
