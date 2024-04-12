{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        server = pkgs.writeShellScriptBin "marp" ''
          ${pkgs.marp-cli}/bin/marp --server --watch .
        '';
      in {
        apps.default = {
          type = "app";
          program = "${server}/bin/marp";
        };
        packages = { inherit server; };
        devShell =
          pkgs.mkShell { buildInputs = with pkgs; [ nixfmt marp-cli docker ]; };
      });
}
