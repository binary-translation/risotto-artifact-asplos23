#!/usr/bin/env bash

cd ${RISOTTO_ROOT}/benchmarks

# parsec
wget https://nextcloud.in.tum.de/index.php/s/AFBrjRbsHkcgF7b/download/parsec-bins.tar.xz
tar xf parsec-bins.tar.xz

# phoenix
wget https://nextcloud.in.tum.de/index.php/s/bZiqieCkr782QWG/download/phoenix-bins.tar.xz
tar xf phoenix-bins.tar.xz

cd ${RISOTTO_ROOT}
