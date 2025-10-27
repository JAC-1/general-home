{ pkgs, ... }:
{
  home.packages = with pkgs; [
    slack
    zoom-us
    # Work-specific packages
  ];
}
