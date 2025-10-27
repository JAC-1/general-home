{ config, pkgs, pkgs-unstable, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    
    # Use unstable neovim for latest features
    package = pkgs-unstable.neovim-unwrapped;
  };

  # Symlink the entire LazyVim config directory
  xdg.configFile."nvim" = {
    source = ../config/nvim;
    recursive = true;
  };
}
