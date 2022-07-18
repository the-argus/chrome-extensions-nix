{
  description = "A nix flake that provides a set of extensions for use in the home-manager chromium module.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # flake-utils = {
    #   url = "github:numtide/flake-utils";
    #   flake = true;
    # };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    # flake-utils.lib.eachDefaultSystem (system:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    (import ./packages.nix { inherit pkgs; });
}
