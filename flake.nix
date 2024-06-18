{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
        pkgs = import nixpkgs {
            system = "aarch64-linux";
            config = {
                allowUnfree = true;
            };
        };
    in {
        nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
                ./nixos/configuration.nix
                # ./nixos/hardware-configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.users.tsubaki = import ./users/tsubaki/home.nix;
                }
            ];
        };
    };
}