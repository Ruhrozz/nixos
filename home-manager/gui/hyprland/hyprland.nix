{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
  };

  home.packages = with pkgs; [
    hyprshot # screenshot handler
  ];
}
