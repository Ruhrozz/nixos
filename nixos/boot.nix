{ lib, ... }: {
  # Grub
  # boot.loader.grub = {
  #   enable = true;
  #   efiSupport = true;
  #   efiInstallAsRemovable = true;
  # };

  # Systemd 
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Lanzaboote
  # boot.loader.systemd-boot.enable = lib.mkForce false;
  # boot.lanzaboote = {
  #  enable = true;
  #  pkiBundle = "/etc/secureboot";
  # };
}
