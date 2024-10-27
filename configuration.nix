{ modulesPath, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];

  # Booting in NixOS
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  time.timeZone = "Asia/Novosibirsk";
  services = {
    openssh.enable = true;
    openssh.settings.PermitRootLogin = "yes";
  };
  environment.systemPackages = with pkgs; [ curl git vim sbctl ];

  users.users = {
    root = {
      initialHashedPassword =
        "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
    };
    ruhrozz = {
      extraGroups = [ "wheel" "networkmanager" ];
      isNormalUser = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";
}
