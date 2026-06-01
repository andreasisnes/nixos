host := "server"

default:
    @just --list

build h=host:
    nixos-rebuild build --flake .#{{h}}

switch h=host:
    sudo nixos-rebuild switch --flake .#{{h}}

boot h=host:
    sudo nixos-rebuild boot --flake .#{{h}}

update:
    nix flake update

fmt:
    nix fmt
