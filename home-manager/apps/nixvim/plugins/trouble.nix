{
  programs.nixvim = {
    plugins.trouble = { enable = true; };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ts";
        action = "<cmd>Trouble symbols focus=true<cr>";
      }
      {
        mode = "n";
        key = "<leader>td";
        action = "<cmd>Trouble diagnostics focus=true<cr>";
      }
    ];
  };
}
