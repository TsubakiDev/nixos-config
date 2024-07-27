{
  pkgs,
  lib,
  config,
  ...
}:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-hangul
    ];
  };
  environment.sessionVariables = {
    NIX_PROFILES = "${lib.concatStringsSep " " (lib.reverseList config.environment.profiles)}";
    XMODIFIERS = "@im=fcitx";
  };
}
