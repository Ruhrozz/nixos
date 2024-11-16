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

    packages = with pkgs; [
      dust # `du -h -d 1` replacement
      duf # `df -h` replacement
      uv # a lot of fast python stuff such as pip venv and uv tool
      pre-commit # can be pip installed, tired from pip installing =)
      shellcheck # bashls nixvim plugin dependency
      ripgrep # telescope nixvim plugin dependency
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
