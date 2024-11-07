{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      sources = [ "filesystem" "git_status" ];
      window.position = "float";

      filesystem.filteredItems = {
        hideDotfiles = false;
        hideGitignored = false;
        hideHidden = false;
      };
    };

    keymaps = [
      # Open Neotree where VIM was launched
      {
        mode = "n";
        key = "\\";
        action = "<cmd>Neotree toggle dir=$PWD<CR>";
      }
      # Open Neotree near opened file
      {
        mode = "n";
        key = "|";
        action = "<cmd>Neotree toggle dir=%:p:h<CR>";
      }
    ];
  };
}
