# My NixOS configuration

It is colaborated with:
- [Home-manager](https://nix-community.github.io/home-manager/) - it is installed as 3rdparty module from [another repo](https://github.com/Ruhrozz/home-manager).
- [Disko](https://github.com/nix-community/disko) - for declarative disk partitioning.
- [NixOS-Anywhere](https://github.com/nix-community/nixos-anywhere?ysclid=m2rkaws15c784895948) - for remote NixOS installation (e.g. using SSH).

# Installation

```bash
nix run github:nix-community/nixos-anywhere -- \
    --generate-hardware-config nixos-generate-config ./hardware-configuration.nix \
    --flake .#generic \
    root@<IP_ADDRESS>
```
