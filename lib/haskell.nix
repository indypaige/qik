{ system
, pkgs
, ...
}:

rec {
  defaultGhcv = "9124";
  mk          = { ghcv ? defaultGhcv
                , tool ? []
                , name
                , root
                , ...
                }:
                  let ghcr = "ghc${ghcv}";
                      ghcp = pkgs.haskell.packages.${ghcr};
                      ghcc = pkgs.haskell.compiler.${ghcr};
                      t    = [ ghcc ghcp.cabal-install pkgs.hpack ] ++ tool;
                  in ghcp.developPackage
                    { modifier = drv: pkgs.haskell.lib.addBuildTools drv t;
                      inherit name root;
                    };
}
