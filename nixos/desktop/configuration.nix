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
        ../../common/settings/nix.nix
    ];

    # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest linux kernel

    networking.hostName = "nixos"; # Define your hostname.
 
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "zh_CN.UTF-8";
        LC_IDENTIFICATION = "zh_CN.UTF-8";
        LC_MEASUREMENT = "zh_CN.UTF-8";
        LC_MONETARY = "zh_CN.UTF-8";
        LC_NAME = "zh_CN.UTF-8";
        LC_NUMERIC = "zh_CN.UTF-8";
        LC_PAPER = "zh_CN.UTF-8";
        LC_TELEPHONE = "zh_CN.UTF-8";
        LC_TIME = "zh_CN.UTF-8";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.tsubaki = {
        isNormalUser = true;
        description = "tsubaki";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
    };

    programs.fish.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        git
        proxychains-ng
    ];

    system.stateVersion = "24.11"; # Did you read the comment?
}
