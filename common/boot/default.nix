{ ... }:
{
  imports = [ ./kernel.nix ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Add support for NTFS
    supportedFilesystems = [ "ntfs" ];

    tmp = {
      useTmpfs = false; # This value will be set to true in next 1 year.
      tmpfsSize = "80%";
    };
  };
}
