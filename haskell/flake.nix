{
  description = "Example haskell flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs { inherit system; });
        hpkgs = pkgs.haskellPackages;
      in
      rec {
        defaultPackage = hpkgs.developPackage { root = self; };
        devShell = hpkgs.shellFor {
          packages = p: [ defaultPackage ];
          nativeBuildInputs = with hpkgs; [
            pkgs.bashInteractive
            cabal-install
            ghcid
            haskell-language-server
          ];
        };
      });
}
