{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      transparent_enabled = true; # transparency plugin
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      colorcolumn = "121";
      smarttab = true;
      smartindent = true;
      expandtab = true;
      number = true;
      mouse = "a";
      cursorline = true;
      scrolloff = 5;
      clipboard = "unnamed";
      undofile = true;
      ttyfast = true;
      autoread = true;
      encoding = "utf-8";
      wrapscan = true;
      splitbelow = true;
      splitright = true;
    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          shiftwidth = 2;
          tabstop = 2;
        };
      };
    };
  };
}
