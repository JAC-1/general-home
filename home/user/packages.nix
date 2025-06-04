{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    home-manager

    # Go
    go
    wails
    libcanberra-gtk3
    # libcanberra-gtk2
    # libcanberra

    # Dev and nvim
    zig
    gcc
    python3
    luarocks
    fd
    nodejs_23
    fzf
    neovim
    alacritty
    eza
    lazygit
    bfg-repo-cleaner
    tree

    # Security
    pass
    gnupg
    mullvad

   # Writing
   pandoc
   texliveTeTeX






  ];
}
