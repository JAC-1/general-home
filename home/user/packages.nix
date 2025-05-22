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


   # Writing
   pandoc
   texliveTeTeX


  ];
}
