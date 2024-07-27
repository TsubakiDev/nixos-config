{ pkgs, ... }:
{
  boot = {
    # Use latest linux kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    # Enable Rust language support
    kernelPatches = [
      {
        name = "Rust Language Support";
        patch = null;
        features = {
          rust = true;
        };
      }
    ];
  };  
}
