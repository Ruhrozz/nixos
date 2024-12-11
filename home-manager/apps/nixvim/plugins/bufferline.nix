{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      diagnostics = "nvim_lsp";
      max_name_length = 18;
      max_prefix_length = 15;
    };
  };
}
