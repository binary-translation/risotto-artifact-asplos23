#!/usr/bin/env bash

NR_RUNS=${NR_RUNS:=10}
OUTPUT=${OUTPUT:=results/parsec-phoenix.csv}

TASKSET="taskset -c 0-111"

####################################

# Reset scaling governor to schedutil on exit
trap "echo schedutil | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor" EXIT

# Set scaling governor to 'performance' (max frequency all the time)
echo performance | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor


# Run all benchmarks natively (aarch64) and with all QEMU variants
benchmarks=(histogram kmeans linearregression matrixmultiply pca stringmatch wordcount)
for b in ${benchmarks[@]}; do
    # native
    ${TASKSET} ./a2a-benchmarks/bench.py  -b phoenix.$b -d large -r native -o ${OUTPUT} -a aarch64 -n $(nproc) -i ${NR_RUNS} -t native -c configs/native.config -vvv

    # QEMUs
    for q in qemu no-fences tcg-tso risotto; do
	${TASKSET} ./a2a-benchmarks/bench.py  -b phoenix.$b -d large -r qemu -o ${OUTPUT} -a x86_64 -n $(nproc) -i ${NR_RUNS} -t $q -c configs/${q}.config -vvv
    done
done

