{ pkgs, ... }:
{
  # Use latest linux kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot = {
    kernel = {
      sysctl = {
        "vm.swappiness" = 10;
      };
    };
  };
}
