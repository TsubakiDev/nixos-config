{ pkgs, ... }:

{
  services = {
    # Ensure gnome-settings-daemon udev rules are enabled.
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    xserver = {
      # Required for DE to launch.
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      # Enable Desktop Environment.
      desktopManager.gnome.enable = true;
      # Configure keymap in X11.
      xkb = {
        layout = "us";
        variant = "";
      };
      # Exclude default X11 packages I don't want.
      excludePackages = with pkgs; [ xterm ];
    };
  };

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
      gedit
      cheese # webcam tool
      gnome-terminal
      epiphany # web browser
      geary # email reader
      evince # document viewer
      totem # video player
    ])
    ++ (with pkgs.gnome; [
      gnome-music
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);
}
