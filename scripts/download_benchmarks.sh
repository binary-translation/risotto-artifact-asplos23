#!/usr/bin/env bash

mkdir -p ${RISOTTO_ROOT}/build
cd ${RISOTTO_ROOT}/build

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

# sqlite
echo "Downloading sqlite pre-built binaries archive..."
wget -O sqlite-bins.tar.xz -q --show-progress https://nextcloud.in.tum.de/index.php/s/W8FMraHb2rxySW2/download/sqlite-bins.tar.xz
echo "Extracting archive..."
pv sqlite-bins.tar.xz | tar xJ

# math
echo "Downloading math pre-built binaries archive..."
wget -O math-bins.tar.xz -q --show-progress https://nextcloud.in.tum.de/index.php/s/fyyWKg6FyECTynk/download/math-bins.tar.xz
echo "Extracting archive..."
pv math-bins.tar.xz | tar xJ

# cas
echo "Downloading CAS pre-built binaries archive..."
wget -O cas.tar.xz -q --show-progress https://nextcloud.in.tum.de/index.php/s/KqAHQ7siJHABBE9/download/cas.tar.xz
echo "Extracting archive..."
pv cas.tar.xz | tar xJ

cd ${RISOTTO_ROOT}
