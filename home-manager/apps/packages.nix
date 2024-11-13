{ pkgs, ... }: {
  home.packages = with pkgs; [
    sshfs
    unzip
    uv # pip and pipenv better analog
    ripgrep # for nvim plugin (telescope)
    shellcheck # for nvim plugin (bashls)
  ];
}
