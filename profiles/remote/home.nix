{ pkgs, settings, ... }: {
  imports = [
    ../../themes/stylix.nix
    ../../home-manager/apps
    ../../home-manager/shell
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    sessionVariables = { EDITOR = settings.editor; };
    stateVersion = "23.05";

    packages = with pkgs;
      [
        glibcLocales # fixing locale problems on Ubuntu
      ];

    file.".bash_login".text = ''
      export LOCALE_ARCHIVE="${pkgs.glibcLocales}/lib/locale/locale-archive";
      export SHELL=`which zsh`
      [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
    '';
    file.".config/nix/nix.conf".text = ''
      experimental-features = nix-command flakes
    '';
  };
}
