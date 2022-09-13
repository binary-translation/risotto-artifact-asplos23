#!/usr/bin/env bash

taskset -p -c 0-111 $$

nix-shell --run ${RISOTTO_ROOT}/scripts/run_parsec.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_phoenix.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_math.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_openssl.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_sqlite.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_cas.sh ${RISOTTO_ROOT}/default.nix
