# Risotto: A Dynamic Binary Translator for Weak Memory Architectures --- Artifact

This repository contains all the code and instructions to reproduce the results from the following paper:

```
Risotto: A Dynamic Binary Translator for Weak Memory Architectures
Redha Gouicem (TU Munich), Dennis Sprokholt (TU Delft), Jasper Ruehl (TU Munich), Rodrigo C. O. Rocha (University of Edinburgh), Tom Spink (University of St Andrews), Soham Chakraborty (TU Delft), Pramod Bhatotia (TU Munich)
International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS), 2023
```

## Content

This repository contains multiple submodules:
* `qemu`: contains our modified QEMU (modified mappings for memory operations, support for native shared libraries, native CAS translation)
* `benchmarks`: contains the benchmarks used in the paper
* `proofs`: contains the formal proof regarding our memory mappings and optimisations

## Requirements
To run these experiments, you will need an arm64 machine with at least ARMv8.2.

For the software dependencies, we rely on NixOS to have a unified execution environment.
You can either install NixOS as a full operationg system, or just as a package manager (Nix) on top of your Linux installation.
You can find out more information on the [Nix download page](https://nixos.org/download.html).

Required packages for the plots are available in the Nix environment, but you can also generate the plots through jupyter notebooks. You will need the following packages installed on your machine:
```sh
apt install python3-pip # install pip
pip install notebook pandas matplotlib

```

## Building the software
Before running the experiments, we need to build the software and the benchmarks.
You can try to build everything at once or separately.

### Building everything
You can build everything by executing:

```sh
source sourceme
./scripts/build.sh
```

If everything works fine, you can skip to [Running the benchmarks](#running-the-benchmarks).

Note that this script downloads the pre-built binaries for the benchmarks and does not build them. If you want to build them, check the following sections.

### Building QEMU
You need to build our modified QEMU for the evaluation to work. It is located in the `qemu` submodule and can be built by running:
```sh
source sourceme
nix-shell --run scripts/build_qemu.sh default.nix
```

Since QEMU will be executed on the ARM machine, it has to be built for ARM. To simplify this, we recommend to build this directly on the ARM machine you will use to reproduce the results of the paper.

After running this script, you should have four versions of QEMU built, located in `build/qemu/`:
* `master-6.1.0`: this is the official QEMU 6.1.0, unmodified (used as a baseline)
* `no-fences`: QEMU 6.1.0 but no fence is generated for any memory access. This version may create incorrect executions (used as a comparison)
* `tcg-tso`: QEMU 6.1.0 + our memory mappings (used to evaluate the performance of our mappings)
* `risotto`: QEMU 6.1.0 + our memory mappings + native CAS + native shared libraries

### Building the benchmarks
The benchmarks need to be built twice: once for arm64 and once for x86_64. You can do this in different ways:
* Download pre-built binaries (recommended)
* Build the x86_64 binaries on an x86_64 machine, and the arm64 binaries on an arm64 machine
* Build everything on the same machine with cross-compilation for the non-native version.

#### Downloading pre-built binaries
We provide an archive with all benchmarks packaged for both x86_64 and arm64 at [this address](https://nextcloud.in.tum.de/index.php/s/XenwcXiHy4TTZMC).
You can just download and extract the archives wherever you want with:
```sh
tar xf <archive.tar.xz>
```

These archives contain the binaries and input data for each benchmark.

#### Build binaries on x86_64 and arm64 machines

#### Build binaries with cross compilation

## Running the benchmarks

This section shows how to run the benchmarks and plot each figure available in the paper.

### Figure 12: PARSEC and Phoenix

You can run these benchmarks by executing these two commands from the root of this repository (after running `source sourceme`):
```sh
nix-shell --run ${RISOTTO_ROOT}/scripts/run_parsec.sh ${RISOTTO_ROOT}/default.nix
nix-shell --run ${RISOTTO_ROOT}/scripts/run_phoenix.sh ${RISOTTO_ROOT}/default.nix
```
The results will be available in `results/parsec-phoenix.csv`. Note that if you run the scripts multiple times, the results are appended to the csv file. If you want to start again from scratch, delete or rename the csv before running the benchmarks.

To plot the figure, start the jupyter notebook server from the root of the repository (if it's not already started):
```sh
jupyter notebook
```
In the browser window, open the `plots/fig12.ipynb` and run all the cells in order. The plot should be available in the 9th cell.

## Proofs

The proofs have their own `README.md` (inside `proofs/`), with explanations. For evaluation, it's easiest to use the pre-build Docker image. Check the proofs with:

```sh
docker run -it --rm sourcedennis/risotto-proofs:latest agda src/Main.agda --safe
```

Generate HTML-rendered Agda with (into local directory `html/`):

```sh
docker run -it --rm -v "$PWD/html:/proofs/html" sourcedennis/risotto-proofs:latest agda --html --html-dir=html src/Main.agda
```

Or, build the Docker images yourself with the contained `proofs/Dockerfile`.
