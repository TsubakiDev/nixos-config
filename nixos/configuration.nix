{ config, pkgs, ... }:

{
    imports = [
        ../common/display/default.nix
        ../common/input/default.nix
        ../common/sound/default.nix
        ../common/fonts/default.nix
        ../common/i18n/default.nix
        ../common/settings/default.nix
    ];

    # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    # Use latest linux kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;
 
    networking.hostName = "laptop";
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Enable CUPS to print documents.
    services.printing.enable = true;

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
        wezterm
    ];

    system.stateVersion = "24.11"; # Did you read the comment?
}
