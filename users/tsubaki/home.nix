{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.username = "tsubaki";
    home.homeDirectory = "/home/tsubaki";

    home.packages = with pkgs; [
        # Browser
        ungoogled-chromium

        # Tools
        vlc
        bitwarden
        zip
        xz
        unzip
        neofetch
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
        qq
    ];

    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
    };

    programs.git = {
        enable = true;
        userName = "TsubakiDev";
        userEmail = "i@tsubakidev.cc";
    };

    programs.fish = {
        enable = true;
    };

    programs.starship = {
        enable = true;
        settings = {
            add_newline = false;
            aws.disabled = true;
            gcloud.disabled = true;
            line_break.disabled = true;
        };
    };

    home.stateVersion = "24.05";

    programs.home-manager.enable = true;
}