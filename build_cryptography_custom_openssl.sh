#!/bin/bash
set -e
CWD=$(pwd)
virtualenv env -p python$PYTHON_VERSION
. env/bin/activate
pip install -U setuptools
pip install -U wheel pip
curl -O https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz
tar xvf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}
./config no-shared no-ssl2 -fPIC --prefix=${CWD}/openssl
make && make install
cd ..
CFLAGS="-I${CWD}/openssl/include" LDFLAGS="-L${CWD}/openssl/lib" pip wheel --no-use-wheel cryptography