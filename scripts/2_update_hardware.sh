#!/usr/bin/env bash
sudo bash -c 'nixos-generate-config --show-hardware-config > ./profiles/desktop/hardware-configuration.nix'
