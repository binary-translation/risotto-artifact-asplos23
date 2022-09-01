#!/usr/bin/env bash

cd ${RISOTTO_ROOT}/benchmarks

# parsec
echo "Downloading PARSEC pre-built binaries archive..."
wget -O parsec-bins.tar.xz -q --show-progress https://nextcloud.in.tum.de/index.php/s/AFBrjRbsHkcgF7b/download/parsec-bins.tar.xz
echo "Extracting archive..."
pv parsec-bins.tar.xz | tar xJ

# phoenix
echo "Downloading Phoenix pre-built binaries archive..."
wget -O phoenix-bins.tar.xz -q --show-progress https://nextcloud.in.tum.de/index.php/s/bZiqieCkr782QWG/download/phoenix-bins.tar.xz
echo "Extracting archive..."
pv phoenix-bins.tar.xz | tar xJ

cd ${RISOTTO_ROOT}
