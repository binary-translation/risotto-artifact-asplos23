#!/usr/bin/env bash

NR_RUNS=10
TASKSET="taskset -c 0-111"

####################################

# Reset scaling governor to schedutil on exit
trap "echo schedutil | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor" EXIT

# Set scaling governor to 'performance' (max frequency all the time)
echo performance | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor


# Run all benchmarks natively (aarch64) and with some QEMU variants
benchmarks=(md5 sh1 sha256 rsa)
for b in ${benchmarks[@]}; do 
    # native
    ${TASKSET} ./a2a-benchmarks/bench.py  -b openssl.${b} -d native -r native -o results/results.csv -a aarch64 -n $(nproc) -i ${NR_RUNS} -t native -c configs/native.config -vvv

    # QEMUs
    ${TASKSET} ./a2a-benchmarks/bench.py -b openssl.${b} -d native -r qemu -o results/results.csv -a x86_64 -n $(nproc) -i ${NR_RUNS} -t master-6.1.0 -c configs/qemu-master-6.1.0.config -vvv
    ${TASKSET} ./a2a-benchmarks/bench.py -b openssl.${b} -d native -r qemu --run-opt='-nlib configs/nlib/openssl.nmi' -o results/results.csv -a x86_64 -n $(nproc) -i ${NR_RUNS} -t risotto -c configs/qemu-risotto.config -vvv
done