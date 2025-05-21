{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];

  home.username = "justin";
  home.homeDirectory = "/home/justin";
  home.stateVersion = "24.11";
}
