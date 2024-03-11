{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "gratgen";
  src = pkgs.fetchurl {
    url = "https://www21.in.tum.de/~lammich/grat/gratgen.tgz";
    sha256 = "27673b4a87f1651aba9a5d366de2c2bf999f7bb9e11fd84830416cb022aa017f";
  };
  buildInputs = [
    pkgs.cmake
    pkgs.boost
  ];
  buildPhase = ''
    echo "OUT IS: $out" >&2
    cmake . -DCMAKE_INSTALL_PREFIX=$out
    make
  '';
  installPhase = "make install";
}
