{
  description = "RuhOs";

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      settings = import (./. + "/settings.nix") { inherit pkgs; };
      pkgs = import nixpkgs { system = settings.system; };
    in {
      # NixOS configuration entrypoint.
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {

          modules = [
            inputs.disko.nixosModules.disko
            inputs.stylix.nixosModules.stylix

            (./. + "/profiles" + ("/" + settings.profile)
              + "/configuration.nix")

            inputs.vscode-server.nixosModules.default
            { services.vscode-server.enable = true; }
          ];

          specialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };

      # Standalone home-manager configuration entrypoint.
      homeConfigurations = {
        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${settings.system};

          modules = [
            (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
            inputs.ags.homeManagerModules.default
          ];

          extraSpecialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };
    };

  inputs = {
    # Required package
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # For widgets like status bar at the top
    ags.url = "github:Aylur/ags";

    # For customizing system
    stylix.url = "github:danth/stylix";

    # For connection to this machine with VS-Code
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # For handling dotfiles in ~/.config/
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Customizing my neovim config
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative disk partitioning
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
