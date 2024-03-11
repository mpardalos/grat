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
  configurePhase = " ";
  buildPhase = ''
    g++ -O3 -DNDEBUG -std=c++11 -pthread -o gratgen gratgen.cpp
  '';
  installPhase = ''
    mkdir -p $out/bin/
    cp gratgen $out/bin/gratgen
  '';
}
