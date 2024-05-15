{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        apps = {
          server = {
            type = "app";
            program = "${self.packages.${system}.server}/bin/marp";
          };
          default = self.apps.${system}.server;
        };
        packages = {
          server = pkgs.writeShellScriptBin "marp" ''
            ${pkgs.marp-cli}/bin/marp --server --watch .
          '';
          default = self.packages.${system}.server;
        };
        devShell =
          pkgs.mkShell { buildInputs = with pkgs; [ nixfmt marp-cli docker ]; };
      });
}
