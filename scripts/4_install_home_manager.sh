#!/usr/bin/env bash
nix --experimental-features "nix-command flakes" run github:nix-community/home-manager -- switch --flake .
