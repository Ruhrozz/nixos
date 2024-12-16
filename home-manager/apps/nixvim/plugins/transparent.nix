{
  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [ "all" "TroubleNormal" "TroubleNormalNC" "TroubleCount" "TroubleFsCount"];
      exclude_groups = [ "StatusLine" "CursorLine" ];
    };
  };
}
