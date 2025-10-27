{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # Essential CLI tools
    eza           # Modern ls replacement
    fd            # Modern find replacement
    fzf           # Fuzzy finder
    ripgrep       # Fast grep alternative
    tree          # Directory tree viewer
    htop          # Process viewer
    btop          # Modern system monitor
    curl
    wget
    git
    gh            # GitHub CLI

    # Development tools
    pkgs-unstable.neovim
    lazygit
    tmux
    
    # Terminal emulators (uncomment as needed)
    # alacritty
    # kitty
    
    # Build essentials (uncomment as needed)
    # gcc
    # gnumake
    # pkg-config
    
    # Language-specific tools (uncomment as needed)
    # Go
    # go
    # gopls
    
    # Rust (managed via rustup typically)
    # rust-analyzer
    
    # Python
    # python3
    # python3Packages.pip
    
    # Node.js (usually managed via NVM)
    # nodejs
    
    # Zig
    # zig
    # zls
    
    # Repository tools
    # bfg-repo-cleaner
    
    # Security tools
    # pass
    # gnupg
    # mullvad
    # mullvad-vpn
    
    # Writing/Documentation
    # pandoc
    # texlive.combined.scheme-full
    
    # Desktop/Wayland utilities (for Hyprland)
    # wl-clipboard      # Wayland clipboard
    # grim              # Screenshot
    # slurp             # Screen region selector
    # swappy            # Screenshot editor
    # waybar            # Status bar
    # wofi              # App launcher
    # mako              # Notification daemon
    # swaylock          # Screen locker
    # swayidle          # Idle manager
    
    # Media
    # mpv
    # imv               # Image viewer
    
    # File management
    # ranger
    # yazi
    
    # Archive tools
    # unzip
    # zip
    # p7zip
    # unrar
  ];
  
  # Programs with additional configuration
  programs = {
    # Modern cat replacement with syntax highlighting
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        style = "numbers,changes,header";
      };
    };
    
    # Directory jumper
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    
    # Better cd
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    
    # Fuzzy finder integration
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
