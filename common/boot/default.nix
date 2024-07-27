{ ... }:
{
  imports = [ ./kernel.nix ];

  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
      };
      efi.canTouchEfiVariables = true;
    };

    # Add support for NTFS
    supportedFilesystems = [ "ntfs" ];

    tmp = {
      useTmpfs = true;
      tmpfsSize = "80%";
    };
  };
}
