#!/usr/bin/env bash

# Build qemu
nix-shell --run ${RISOTTO_ROOT}/scripts/build_qemu.sh ${RISOTTO_ROOT}/default.nix

# Download benchmarks binaries
nix-shell --run ${RISOTTO_ROOT}/scripts/build_benchmarks.sh ${RISOTTO_ROOT}/default.nix

