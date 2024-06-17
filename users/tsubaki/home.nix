{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.username = "tsubaki";
    home.homeDirectory = "/home/tsubaki";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        # Browser
        ungoogled-chromium

        # Tools
        vlc
        bitwarden
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
        #discord
        #qq
    ];

    programs = {
        vscode = {
            enable = true;
            package = pkgs.vscode.fhs;
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