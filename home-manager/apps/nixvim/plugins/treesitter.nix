{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = true;
      highlight.enable = true;
      indent.enable = false;
      incremental_selection.enable = true; # see gnn + grn/grm/grc
    };
  };
}
