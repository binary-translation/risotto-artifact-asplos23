#!/usr/bin/env bash


function build() {
    for p in master-6.1.0 no-fences tcg-tso risotto; do
	# switch the qemu repo to the proper branch
	cd ${RISOTTO_ROOT}/qemu
	git switch ${p}

	# create the build directory
	mkdir -p ${RISOTTO_ROOT}/build/${p}
	cd ${RISOTTO_ROOT}/build/${p}

	# build qemu
	${RISOTTO_ROOT}/qemu/configure --target-list=x86_64-linux-user
	make -j $(nproc)

	cd ${RISOTTO_ROOT}
    done
}

nix-shell --run build ${RISOTTO_ROOT}/default.nix
