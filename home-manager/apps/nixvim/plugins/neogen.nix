{
  programs.nixvim = {
    plugins.neogen = {
      enable = true;
      languages.python.template.annotation_convention = "numpydoc";
      snippetEngine = "luasnip";
      inputAfterComment = true;
    };
    keymaps = [{
      action = "<cmd>Neogen<cr>";
      key = "<leader>gd";
      mode = ["n"];
    }];
  };
}
