#!/usr/bin/env bash

export NR_RUNS=3

DATASET=simsmall nix-shell --run ${RISOTTO_ROOT}/scripts/run_parsec.sh ${RISOTTO_ROOT}/default.nix
DATASET=small nix-shell --run ${RISOTTO_ROOT}/scripts/run_phoenix.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_math.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_openssl.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_sqlite.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_cas.sh ${RISOTTO_ROOT}/default.nix
