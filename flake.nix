{
  description = "gratgen and gratchk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    isabelle2022.url = "github:mpardalos/isabelle.nix";
  };

  outputs = { self, nixpkgs, flake-utils, isabelle2022 }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages = {
          gratgen = pkgs.callPackage ./gratgen.nix {};
          gratchk = pkgs.callPackage ./gratchk.nix { isabelle2022 = isabelle2022; system = system; };
        };
      }
    );
}
