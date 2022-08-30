#!/usr/bin/env bash

nix-shell --run ${RISOTTO_ROOT}/scripts/build_qemu.sh ${RISOTTO_ROOT}/default.nix

