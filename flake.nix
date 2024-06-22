{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { self, nixpkgs, home-manager, ... } @inputs: {
        nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./nixos/hardware-configuration.nix
                ./nixos/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.users.tsubaki = import ./users/tsubaki/home.nix;
                }
            ];
        };
    };
}
