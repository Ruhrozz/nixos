{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    catppuccin.url = "github:catppuccin/nix";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, vscode-server, catppuccin, ... }:
    let
      system = "x86_64-linux";
      user = "ruhrozz";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs.user = user;

        modules = [
          catppuccin.nixosModules.catppuccin
          disko.nixosModules.disko

          vscode-server.nixosModules.default
          { services.vscode-server.enable = true; }

          ./modules/configuration.nix
          ./modules/hardware-configuration.nix
        ];
      };
    };
}
