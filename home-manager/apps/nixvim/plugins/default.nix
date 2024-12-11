{
  imports = [
    ./colorscheme.nix
    ./lsp.nix
    ./gitsigns.nix
    ./hop.nix
    ./neotree.nix
    ./telescope.nix
    ./trouble.nix
    ./treesitter.nix
    ./autopairs.nix
    ./comment.nix
    ./colorizer.nix
    ./bufferline.nix
  ];

  programs.nixvim.plugins.web-devicons.enable = true;
}
