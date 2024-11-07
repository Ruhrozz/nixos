{ settings, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = settings.name;
    userEmail = settings.email;
    diff-so-fancy.enable = true;
  };
}
