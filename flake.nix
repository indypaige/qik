{
  inputs =
    { flake-utils.url = "github:numtide/flake-utils";
          nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

  outputs =
    { flake-utils
    , nixpkgs
    , self
    , ...
    }: flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs =    import nixpkgs { inherit system;              };
            load = l: import l       { inherit system pkgs nixpkgs; };
        in
          { lib.haskell = load ./lib/haskell.nix;
          });
}
