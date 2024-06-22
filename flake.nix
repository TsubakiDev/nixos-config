{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { self, nixpkgs, home-manager, ... } @inputs: {

        nixosConfigurations.aarch64_laptop = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
                ./nixos/aarch64/hostname.nix
                # ./nixos/aarch64/hardware-configuration.nix
                
                ./nixos/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.users.tsubaki = import ./users/tsubaki/home.nix;
                }
            ];
        };

        nixosConfigurations.mbp = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./nixos/x86_64/hostname.nix
                ./nixos/x86_64/hardware-configuration.nix

                ./nixos/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.users.tsubaki = import ./users/tsubaki/home.nix;
                }
            ];
        };

    };
}
