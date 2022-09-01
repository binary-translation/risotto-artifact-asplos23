#!/usr/bin/env bash

for p in master-6.1.0 no-fences tcg-tso risotto; do
    # switch the qemu repo to the proper branch
    cd ${RISOTTO_ROOT}/qemu
    git switch ${p}

    # create the build directory
    mkdir -p ${RISOTTO_ROOT}/build/qemu/${p}
    cd ${RISOTTO_ROOT}/build/qemu/${p}

    # build qemu
    ${RISOTTO_ROOT}/qemu/configure --target-list=x86_64-linux-user
    make -j $(nproc)

    cd ${RISOTTO_ROOT}
done
