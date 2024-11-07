{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  # NixOS cannot run dynamically linked executables intended for generic Linux 
  # environments out of the box. This is because, by design, it does not have a 
  # global library path, nor does it follow the Filesystem Hierarchy Standard (FHS).
  # See https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.nix-ld.libraries = with pkgs;
    [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
      uv
    ];
}
