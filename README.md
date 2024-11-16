# ❄ Nix Stuff ❄

Some "nix stuff" repository:
- Disko
- NixOS
- Home-manager

# Installation guide

First of all you need to clone repository

```bash
git clone https://github.com/Ruhrozz/nix.git ~/.dotfiles
```

After that modify `./settings.nix` according to your preferences.

Further guide depend on your chosen profile.

## NixOS (i.e. desktop/laptop)

### With bootable USB flash drive 

1. Boot with NixOS USB drive
2. Make disk partitioning with [disko](https://github.com/nix-community/disko?ysclid=m37md4ni64813417409):
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
  --mode disko ./profiles/desktop/disk-config.nix
```
3. Update `hardware-configuration.nix`:
```bash
sudo nixos-generate-config --show-hardware-config > ./profiles/desktop/hardware-configuration.nix
```
> Disko already defines filesystems, so you need to remove redundant defines
4. Install NixOS itself:
```bash
sudo nixos-install --flake .#nixos
```
5. Enter fresh installed NixOS, switch to another tty, login as user and update home-manager:
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/home-manager -- switch --flake .
```

### With [nixos-anywhere](https://github.com/nix-community/nixos-anywhere?ysclid=m37mp47i7c377992155)

1. Run nixos-anywhere to install system via ssh:
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/nixos-anywhere -- \
  --generate-hardware-config nixos-generate-config ./profiles/desktop/hardware-configuration.nix --flake .#nixos root@<ip address>
```
> Default password for root connection is `ASDzxc123`, do not forget to update pass with passwd.
2. Clone repo and update `hardware-configuration.nix` or use `scp` to copy repo to remote host
3. Enter fresh installed NixOS via ssh, login as user and update home-manager:
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/home-manager -- switch --flake .
```

## Remote (home-manager apps without gui)

You only need to install home-manager.
Moreover, remote installation settings are set up by default.

So there is fast home-manager developing:
```bash
git clone https://github.com/Ruhrozz/nix.git ~/.dotfiles
nix --experimental-features "nix-command flakes" run github:nix-community/home-manager -- switch --flake ~/.dotfiles
```

# Appreciation

Special thanks to Nikita Zheleztsov (Serpentian) and his [AlfheimOS](https://github.com/Serpentian/AlfheimOS) for being a starting-point of this repository.
It was so hard to find a good NixOS configuration with custom SOTA status bar such as [ags](https://github.com/adventuregamestudio/ags) and Hyprland window manager.
