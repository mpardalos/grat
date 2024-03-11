{
  description = "gratgen and gratchk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.gratgen = pkgs.callPackage ./gratgen.nix {};
        packages.gratchk = pkgs.callPackage ./gratchk.nix {};
      }
    );
}
