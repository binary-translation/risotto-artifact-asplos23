#!/usr/bin/env bash

NR_RUNS=${NR_RUNS:=10}
OUTPUT=${OUTPUT:=results/sqlite.csv}

####################################

# Reset scaling governor to schedutil on exit
trap "echo schedutil | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor" EXIT

# Set scaling governor to 'performance' (max frequency all the time)
echo performance | sudo tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor


# Run all benchmarks natively (aarch64) and with some QEMU variants
# native
./a2a-benchmarks/bench.py  -b micro.sqlite -d native -r native -o ${OUTPUT} -a aarch64 -n $(nproc) -i ${NR_RUNS} -t native -c configs/native.config -vvv

# QEMUs
./a2a-benchmarks/bench.py -b micro.sqlite -d native -r qemu -o ${OUTPUT} -a x86_64 -n $(nproc) -i ${NR_RUNS} -t qemu -c configs/qemu.config -vvv
./a2a-benchmarks/bench.py -b micro.sqlite -d native -r qemu --run-opt='-nlib configs/nlib/sqlite.nmi' -o ${OUTPUT} -a x86_64 -n $(nproc) -i ${NR_RUNS} -t risotto -c configs/risotto.config -vvv

