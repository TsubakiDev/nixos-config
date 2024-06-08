{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        aagl.url = "github:ezKEa/aagl-gtk-on-nix";
        aagl.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { self, nixpkgs, home-manager, aagl, ... } @inputs:
    let
        pkgs = import nixpkgs {
            system = "x86_64-linux";
            config = {
                allowUnfree = true;
            };
        };
    in {
        # PC
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./nixos/desktop/configuration.nix
                ./nixos/desktop/pc/hardware-configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.users.tsubaki = import ./users/tsubaki/home.nix;
                }

                {
                    imports = [ aagl.nixosModules.default ];
                    nix.settings = aagl.nixConfig; # Set up Cachix
                    programs.anime-game-launcher.enable = true;
                    programs.honkers-railway-launcher.enable = true;
                }
            ];
        };
    };
}