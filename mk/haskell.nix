{ system
, pkgs
, ...
}:

{ ghcv ? "9124"
, name
, root
, ...
}:
let ghcv = "ghc${ghcv}";
    ghcp = pkgs.haskell.packages.${ghcv};
    ghcc = pkgs.haskell.compiler.${ghcv};
    tool = [ ghcc ghcp.cabal-install pkgs.hpack ];
in ghcp.developPackage
  { modifier = drv: pkgs.haskell.lib.addBuildTools drv tool;
    inherit name root;
  }
