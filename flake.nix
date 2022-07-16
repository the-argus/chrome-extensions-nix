{
  description = "A nix flake that provides a set of extensions for use in the home-manager chromium module.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    { } // (import ./packages.nix { inherit pkgs; });
}
