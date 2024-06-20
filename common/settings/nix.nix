{ lib, ... }:

{
    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        # Use SJTU Mirror.
        substituters = lib.mkForce [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
        auto-optimise-store = true;
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
    };
}