{ pkgs, ... }: {
  home.packages = with pkgs; [
    sshfs
    unzip
    dust # `du -h -d 1` replacement
    duf # `df -h` replacement
    pre-commit # can be pip installed, tired from pip installing =)
    uv # pip and pipenv better analog
    ripgrep # for nvim plugin (telescope)
    shellcheck # for nvim plugin (bashls)
  ];
}
