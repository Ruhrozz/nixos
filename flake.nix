{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    grub_theme.url = "github:Machillka/GameDevClub-GRUB-Theme";
    home-manager.url = "github:Ruhrozz/home-manager/nixos";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, disko, grub_theme, home-manager, ... }: {
      # nixos-anywhere --flake .#generic --generate-hardware-config nixos-generate-config ./hardware-configuration.nix <hostname>
      nixosConfigurations.generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          grub_theme.nixosModules.default
          home-manager.nixosModules.nixos

          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
}
