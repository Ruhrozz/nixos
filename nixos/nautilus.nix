{ settings, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ nautilus sushi ];

  services.gnome.sushi.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = settings.term;
  };
}
