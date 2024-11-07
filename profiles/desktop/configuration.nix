{ modulesPath, pkgs, settings, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./disk-config.nix
    ../../nixos/greeter.nix
    ../../nixos/ssh.nix
    ../../nixos/bluetooth.nix
    ../../nixos/boot.nix
    ../../nixos/sound.nix
    ../../nixos/nautilus.nix
    ../../nixos/nvidia.nix
    ../../nixos/nix-ld.nix
    # For some games
    ../../nixos/steam.nix
    ../../nixos/appimage.nix
    ../../nixos/opentabletdriver.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Netorking
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = settings.timezone;
  services.chrony.enable = true;

  # Locale.
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = { LC_ALL = settings.locale; };

  # Users.
  users.users.root.initialHashedPassword =
    "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.username;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # List of globally installed packages.
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
    wget
    curl
    git
    vim
    neovide
    telegram-desktop
    obsidian
    osu-lazer
  ];

  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-color-emoji
    settings.fontPkg
  ];

  services.gvfs.enable = true; # A lot of mpris packages require it.

  system.stateVersion = "24.05";
}
