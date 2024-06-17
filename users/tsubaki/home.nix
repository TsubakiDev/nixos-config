{ pkgs, ... }:

let
  aagl-gtk-on-nix = import (
    builtins.fetchTarball {
        url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
        sha256 = "9bf12b2b6ed25637b127fa96d6bd9758fe784420dc9b0e1fa67f47eb088454e5";
    }
  );
in
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
        thunderbird

        # Programming Languages
        rustup
        go

        # IDE
        jetbrains.idea-community

        # IM
        telegram-desktop
        
        # Games
        aagl-gtk-on-nix.honkers-railway-launcher
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