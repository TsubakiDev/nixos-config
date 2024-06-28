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
        nfu = "sudo nix flake update";
    };

    home.packages = with pkgs; [
        # Browser
        google-chrome

        # Tools
        xz
        nix-output-monitor
        fastfetch

        # Utility Softwares
        vlc
        bitwarden-desktop
        clash-verge-rev

        # Programming Languages
        rustup
        go

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
            plugins = with pkgs.vimPlugins; [
                vim-nix
            ];
        };

        git = {
            enable = true;
            userName = "TsubakiDev";
            userEmail = "i@tsubakidev.cc";
        };

        fish = { 
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
