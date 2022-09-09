#!/usr/bin/env bash

cd ${RISOTTO_ROOT}/benchmarks/parsec-benchmark

./get-inputs

source env.sh
parsecmgmt -a build -p blackscholes bodytrack canneal facesim ferret fluidanimate freqmine streamcluster swaptions vips

cd -
