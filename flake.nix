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
          { haskell.mk = load ./mk/haskell.nix;
          });
}
