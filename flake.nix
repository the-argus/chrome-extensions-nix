{
  description = "A nix flake that provides a set of extensions for use in the home-manager chromium module.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      if (system == flake-utils.lib.system.aarch64-darwin) then {} else
        (import ./packages.nix { inherit pkgs; })
    );
}
