let
  tarball = "https://github.com/NixOS/nixpkgs/archive/f0869b1a2c0b150aac26e10bb5c2364ffb2e804f.tar.gz";

  pkgs = import (fetchTarball tarball) {};

  pypkgs = [ pkgs.python3Packages.pandas
             pkgs.python3Packages.tqdm
             pkgs.python3Packages.matplotlib ];

  deps = p: [
    p.gcc10
    p.zlib
    p.curl
    p.getopt
    p.flex
    p.binutils
    p.bison
    p.bc
    p.pkg-config
    p.m4
    p.which
    p.gnumake
    p.cmake
    p.gettext
    p.autoconf
    p.sqlite
    p.openssl
    p.glib
    p.yasm
    p.ninja
    p.pv
  ];

in

with import (fetchTarball tarball) {};

gcc10Stdenv.mkDerivation {
  RISOTTO_ROOT = builtins.getEnv "RISOTTO_ROOT";

  name = "risotto-native";
  nativeBuildInputs = [
    bashInteractive
  ];
  buildInputs = pypkgs ++ deps pkgs;
  runScript = "bash";
}
