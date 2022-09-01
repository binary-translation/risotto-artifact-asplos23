#!/usr/bin/env bash

# Build qemu
nix-shell --run ${RISOTTO_ROOT}/scripts/build_qemu.sh ${RISOTTO_ROOT}/default.nix

# Download benchmarks
cd benchmarks
wget https://nextcloud.in.tum.de/index.php/s/AFBrjRbsHkcgF7b/download/parsec-bins.tar.xz
tar xf parsec-bins.tar.xz
cd -
