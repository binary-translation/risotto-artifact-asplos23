#!/usr/bin/env bash

# Build qemu
nix-shell --run ${RISOTTO_ROOT}/scripts/build_qemu.sh ${RISOTTO_ROOT}/default.nix
