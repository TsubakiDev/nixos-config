{
  pkgs,
  ...
}:
{
  home = {
    username = "tsubaki";
    homeDirectory = "/home/tsubaki";
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "nvim";
      MOZ_USE_XINPUT2 = "1";
      XMODIFIERS = "@im=fcitx";
    };

    shellAliases = {
      uflake = "sudo nix flake update";
      nswitch = "sudo bash -c 'nixos-rebuild switch |& nom'";
    };
  };

  fonts.fontconfig.enable = true;

  services.mako.enable = true;

  home.packages = with pkgs; [
    # Utilities
    nix-output-monitor
    treefmt
    fastfetch
    zenith
    rustdesk-flutter
    xwayland-satellite

    # Development
    rustup
    graalvmPackages.graalvm-ce
    vscode-fhs
    jetbrains.idea-community-bin

    # Internet Messaging
    thunderbird
    telegram-desktop
    wechat-uos
    qq

    # Media
    vlc
    obs-studio
    spotify

    # Password Management
    bitwarden-desktop
    yubioath-flutter

    # Gaming
    steam
    gdlauncher-carbon

    # Others
    firefox
    wineWowPackages.stable

    # Fonts
    iosevka
    noto-fonts-cjk-sans
  ];

  programs.git = {
    enable = true;
    userName = "TsubakiDev";
    userEmail = "i@tsubaki.dev";
    /*
      signing = {
        key = "C50CA983F44B4FA3";
        signByDefault = true;
      };
    */
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-nix ];
  };

  programs.fish.enable = true;
  programs.home-manager.enable = true;
}
