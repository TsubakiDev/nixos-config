{ pkgs, ... }:
{
    # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    # Use latest linux kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Support NTFS
    boot.supportedFilesystems = [ "ntfs" ];
}