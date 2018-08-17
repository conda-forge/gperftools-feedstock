#!/bin/bash

if [ $(uname) == Darwin ]; then
  export CC=clang
  export CXX=clang++
  export MACOSX_DEPLOYMENT_TARGET="10.9"
fi

./autogen.sh

if [ $(uname) == Darwin ]; then
  ./configure  --prefix $PREFIX
else
  ./configure  --prefix $PREFIX --enable-libunwind
fi

make
make check
make install
