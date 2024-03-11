{ pkgs ? import <nixpkgs> {},
  system,
  isabelle2022
}:
let
  isabelle = isabelle2022.packages.${system}.isabelle.withComponents [
    isabelle2022.packages.${system}.isabelle-afp
  ];
in
  pkgs.stdenv.mkDerivation {
    name = "gratchk";
    src = pkgs.fetchurl {
      url = "https://www21.in.tum.de/~lammich/grat/gratchk.tgz";
      sha256 = "55a99340bf2a2ee6343d06c91a314fea34b28af638ed3edc37987de579265b85";
    };
    buildInputs = [
      pkgs.mlton
      isabelle
    ];
    configurePhase = " ";
    buildPhase = ''
      isabelle build -D.
      cd code
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp gratchk $out/bin/gratchk
    '';
  }
