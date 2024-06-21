# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [
        ../../common/display.nix
        ../../common/input.nix
        ../../common/sound.nix
        ../../common/fonts.nix
        ../../common/internationalisation.nix
        ../../common/settings/nix.nix
    ];

    # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    # Use latest linux kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;
 
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable Waydroid. (To play anime games)
    virtualisation.waydroid.enable = true;

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
    ];

    system.stateVersion = "24.11"; # Did you read the comment?
}
