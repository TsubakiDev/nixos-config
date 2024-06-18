{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.username = "tsubaki";
    home.homeDirectory = "/home/tsubaki";
    home.stateVersion = "24.05";

    home.sessionVariables = {
        EDITOR = "nvim";
        MOZ_USE_XINPUT2 = "1";
    };

    home.shellAliases = {
        nswitch = "sudo bash -c 'nixos-rebuild switch |& nom'";
        genshin-start = "waydroid app launch GenshinImpact";
        starrail-start = "waydroid app launch Honkai:StarRail";
    };

    home.packages = with pkgs; [
        # Browser
        ungoogled-chromium

        # Tools
        vlc
        zip
        unzip
        nix-output-monitor
        clash-verge-rev

        # Programming Languages
        rustup
        go

        # IDE
        jetbrains.idea-community

        # IM
        telegram-desktop
    ];

    programs = {
        vscode = {
            enable = true;
            package = pkgs.vscode.fhs;
        };

        neovim = {
            enable = true;
            plugins = with pkgs.vimPlugins; [vim-nix];
        };

        git = {
            enable = true;
            userName = "TsubakiDev";
            userEmail = "i@tsubakidev.cc";
        };

        fish = { 
            enable = true;
        };

        thunderbird = {
            enable = true;
        };

        starship = {
            enable = true;
            settings = {
                add_newline = false;
                aws.disabled = true;
                gcloud.disabled = true;
                line_break.disabled = true;
            };
        };

        home-manager = { 
            enable = true;
        };
    };
}