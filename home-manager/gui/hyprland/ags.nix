{ inputs, pkgs, settings, lib, config, ... }:
let
  asztal = pkgs.callPackage ./ags/default.nix { inherit inputs; };

  details = settings.themeDetails;
  agsColors = {
    wallpaper = details.wallpaper;
    theme = {
      blur = (1 - details.opacity) * 100;
      radius = details.rounding;
      shadows = details.shadow;
      palette = {
        primary = {
          bg = "#${config.lib.stylix.colors.base0D}";
          fg = "#${config.lib.stylix.colors.base00}";
        };
        secondary = {
          bg = "#${config.lib.stylix.colors.base0E}";
          fg = "#${config.lib.stylix.colors.base00}";
        };
        error = {
          bg = "#${config.lib.stylix.colors.base06}";
          fg = "#${config.lib.stylix.colors.base00}";
        };
        bg = "#${config.lib.stylix.colors.base00}";
        fg = "#${config.lib.stylix.colors.base05}";
        widget = "#${config.lib.stylix.colors.base05}";
        border = "#${config.lib.stylix.colors.base05}";
      };
    };
    font = {
      size = settings.fontSize;
      name = "${settings.font}";
    };
    widget = { opacity = details.opacity * 100; };
  };

  agsOptions = lib.recursiveUpdate agsColors details.ags;
in {
  home.packages = with pkgs; [
    asztal
    bun
    fd
    dart-sass
    gtk3
    pulsemixer
    networkmanager
    pavucontrol
    brightnessctl
    accountsservice
    which
    fzf
    swww
    slurp
    wl-clipboard
    wayshot
    swappy
    hyprpicker
  ];

  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs; [
      bun
      fd
      dart-sass
      gtk3
      pulsemixer
      networkmanager
      pavucontrol
      brightnessctl
      accountsservice
      which
      fzf
      swww
      slurp
      wl-clipboard
      wayshot
      swappy
      hyprpicker
    ];
  };

  home.file.".cache/ags/options-nix.json".text = (builtins.toJSON agsOptions);
}
