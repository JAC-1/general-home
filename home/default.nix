{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];

  # User information
  home.username = "justin";
  home.homeDirectory = "/home/justin";

  # Home Manager version - DO NOT CHANGE unless upgrading
  home.stateVersion = "25.05";

  # Disable version check (temporary fix for mismatch)
  home.enableNixpkgsReleaseCheck = false;

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
