#!/usr/bin/env bash

cd benchmarks

# parsec
wget https://nextcloud.in.tum.de/index.php/s/AFBrjRbsHkcgF7b/download/parsec-bins.tar.xz
tar xf parsec-bins.tar.xz

# phoenix
cd phoenix/phoenix-2.0
make

cd -

