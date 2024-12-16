{
  imports = [ ./plugins ./settings.nix ];
  programs.nixvim = {
    enable = true;
    keymaps = [{
      action = "@@";
      key = "Q";
      options.silent = true;
      mode = [ "n" "v" ];
    }];
  };

}
