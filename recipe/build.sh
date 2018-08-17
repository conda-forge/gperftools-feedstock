#!/bin/bash

if [ $(uname) == Darwin ]; then
  export CC=clang
  export CXX=clang++
  export MACOSX_DEPLOYMENT_TARGET="10.9"
fi

./autogen.sh
./configure  --prefix $PREFIX --enable-libunwind

make
make check
make install
