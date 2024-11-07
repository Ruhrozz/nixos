{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      colorcolumn = "120";
      smarttab = true;
      smartindent = true;
      expandtab = true;
      number = true;
      mouse = "a";
      cursorline = true;
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
