#!/usr/bin/env bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
  --mode disko ./profiles/desktop/disk-config.nix
