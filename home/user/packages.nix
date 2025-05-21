{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    home-manager

    # Dev and nvim
    zig
    gcc
    python3
    luarocks
    fd
    nodejs_23
    fzf
    neovim

   # Gaming
    # pkgs.steam
    # pkgs.steam-run
    # pkgs.yuzu-mainline
    # (pkgs.lutris.override {
    #   extraPkgs = pkgs: [
    #     pkgs.wineWowPackages.stable
    #     pkgs.winetricks
    #   ];
    # })

    # Downloads
    # pkgs.qbittorrent

    # Utils
    # viewnior
    # hyprshot
    # catppuccin-cursors.macchiatoBlue
    # catppuccin-gtk
    # papirus-folders
  ];
}
