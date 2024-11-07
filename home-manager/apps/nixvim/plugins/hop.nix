{
  programs.nixvim = {
    plugins.hop = { enable = true; };
    keymaps = [
      {
        mode = "n";
        key = "<leader>hh";
        action = "<cmd>HopWord<CR>";
      }
      {
        mode = "n";
        key = "<leader>hl";
        action = "<cmd>HopLineStart<CR>";
      }
    ];
  };
}
