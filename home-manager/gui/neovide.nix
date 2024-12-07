{ settings, ... }: {
  programs.neovide = {
    enable = true;
    settings.font = {
      normal = [settings.font];
      size = settings.fontSize;
    };
  };
}
