{ system
, pkgs
, ...
}:

{ ghcv ? "9124"
, name
, root
, ...
}:

{
  mk = let ghcr = "ghc${ghcv}";
           ghcp = pkgs.haskell.packages.${ghcr};
           ghcc = pkgs.haskell.compiler.${ghcr};
           tool = [ ghcc ghcp.cabal-install pkgs.hpack ];
       in ghcp.developPackage
         { modifier = drv: pkgs.haskell.lib.addBuildTools drv tool;
           inherit name root;
         };
}
