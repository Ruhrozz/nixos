{ modulesPath, pkgs, config, user, inputs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];

  # Booting in NixOS
  boot = {
    plymouth.catppuccin.enable = true;
    loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      catppuccin.enable = true;
    };
  };

  catppuccin.enable = true;

  # For wifi management
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Novosibirsk";

  services = {
    xserver.videoDrivers = ["nvidia"];
    getty.autologinUser = user;
    power-profiles-daemon.enable = true;
    
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
    };

    greetd = {
      enable = true;
      vt = 7;
      settings = {
        default_session = {
          user = user;
          command = builtins.concatStringsSep " " [
            "${pkgs.greetd.tuigreet}/bin/tuigreet"
            "--asterisks"
            "--remember"
            "--time"
            "--cmd Hyprland"
          ];
        };
      };
    };
  };

  # Installed packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ 
      meson
  wayland-protocols
  wayland-utils
  wl-clipboard
  wlroots
  curl git vim sbctl ];
  fonts.packages = with pkgs; [ noto-fonts corefonts ];

  users.users = {
    root.initialHashedPassword = "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
    ${user} = {
      extraGroups = [ "wheel" "networkmanager" "input" ];
      isNormalUser = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
