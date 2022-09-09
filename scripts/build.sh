#!/usr/bin/env bash

# Build qemu
nix-shell --run ${RISOTTO_ROOT}/scripts/build_qemu.sh ${RISOTTO_ROOT}/default.nix

if [ "$1" == "build" ] ; then
    # Build benchmarks binaries
    nix-shell --run ${RISOTTO_ROOT}/scripts/build_benchmarks.sh ${RISOTTO_ROOT}/default.nix
else
    # Download benchmarks binaries
    nix-shell --run ${RISOTTO_ROOT}/scripts/download_benchmarks.sh ${RISOTTO_ROOT}/default.nix
fi
