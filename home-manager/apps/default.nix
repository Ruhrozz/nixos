{ ... }:

{
  imports = [
    ./eza.nix
    ./git.nix
    ./htop.nix
    ./nixvim
    ./ssh.nix
    ./tmux.nix
    ./packages.nix
    ./zoxide.nix
  ];

  programs.thefuck.enable = true;
  programs.bat.enable = true;
}
