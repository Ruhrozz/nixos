{ settings, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pciutils # for `lspci`
    usbutils # for `lsusb`
    wget # cli download
    curl # cli download
    git # code repositories
    vim # reserve editor
    eog # image viewer
    vlc # video viewer

    # Some apps
    neovide # GUI for NeoVIM
    telegram-desktop # contacts
    obsidian # all my life is here
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
}
