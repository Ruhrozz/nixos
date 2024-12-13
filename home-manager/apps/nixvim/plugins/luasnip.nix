{
  programs.nixvim = {
    plugins.luasnip.enable = true;
    keymaps = [
      {
        action.__raw = ''function() require("luasnip").expand() end'';
        key = "<C-k>";
        mode = [ "i" ];
        options.silent = true;
      }
      {
        action.__raw = ''function() require("luasnip").jump(1) end'';
        key = "<C-l>";
        mode = [ "i" "s" ];
        options.silent = true;
      }
      {
        action.__raw = ''function() require("luasnip").jump(-1) end'';
        key = "<C-j>";
        mode = [ "i" "s" ];
        options.silent = true;
      }
      {
        action.__raw = ''
          function()
            if require("luasnip").choice_active() then
              require("luasnip").change_choice(1)
            end
          end
        '';
        key = "<C-e>";
        mode = [ "i" "s" ];
        options.silent = true;
      }
    ];
  };
}
