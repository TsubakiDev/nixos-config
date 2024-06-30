{ config, pkgs, ... }:

{
    imports = [
        ../common/display/default.nix
        ../common/input/default.nix
        ../common/sound/default.nix
        ../common/fonts/default.nix
        ../common/i18n/default.nix
        ../common/settings/default.nix
        ../common/networking/default.nix
        ../common/boot/default.nix

        ../services/dae/default.nix
        ../services/printing/default.nix
    ];

    networking.hostName = "laptop";

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.tsubaki = {
        isNormalUser = true;
        description = "tsubaki";
        uid = 1000;
        extraGroups = [ 
            "networkmanager"
            "wheel"
        ];
        shell = pkgs.fish;
    };

    programs.fish.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        git
        gcc
    ];

    system.stateVersion = "24.11"; # Did you read the comment?
}
