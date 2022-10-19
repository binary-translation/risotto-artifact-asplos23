#!/usr/bin/env bash


nix-shell --run 'jupyter nbconvert --to notebook --inplace --execute plots/fig*.ipynb' ${RISOTTO_ROOT}/default.nix
