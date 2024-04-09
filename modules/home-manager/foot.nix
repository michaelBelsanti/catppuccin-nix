{ config
, lib
, sources
, ...
}:
let
  inherit (lib) ctp;
  cfg = config.programs.foot.catppuccin;
  enable = cfg.enable && config.programs.foot.enable;
in
{
  options.programs.foot.catppuccin =
    ctp.mkCatppuccinOpt "foot";

  config = lib.mkIf enable {
    programs.foot.settings = lib.importTOML "${sources.foot}/catppuccin-${cfg.flavour}.ini";
  };
}
