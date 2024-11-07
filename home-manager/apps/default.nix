{ ... }:

{
  imports = [ ./eza.nix ./git.nix ./htop.nix ./nixvim ./ssh.nix ./tmux.nix ];

  programs.thefuck.enable = true;
  programs.bat.enable = true;
}
