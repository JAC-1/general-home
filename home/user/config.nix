# File and directory linking configuration
# Links dotfiles from the config directory to appropriate locations
let 
  configDir = ../config;
  # Firefox profile directory - adjust this to match your actual profile
  firefoxProfile = ".mozilla/firefox/892a52q8.default-release";
in
{
  home.file = {
    # Hyprland configuration (window manager)
    ".config/hypr" = {
      source = "${configDir}/hypr";
      recursive = true;
    };
    
    # Terminal configuration
    ".config/kitty" = {
      source = "${configDir}/kitty";
      recursive = true;
    };
    
    # Text editor
    ".config/zed" = {
      source = "${configDir}/zed";
      recursive = true;
    };
    
    # Wallpapers
    ".config/wallpapers" = {
      source = "${configDir}/wallpapers";
      recursive = true;
    };
    
    # Firefox customization
    "${firefoxProfile}/chrome" = {
      source = "${configDir}/firefox/chrome";
      recursive = true;
    };
    
    # Optional configurations (uncomment as needed)
    
    
    # System monitor
    # ".config/btop" = {
    #   source = "${configDir}/btop";
    #   recursive = true;
    # };
    
    # Wayland bar
    # ".config/waybar" = {
    #   source = "${configDir}/waybar";
    #   recursive = true;
    # };
    
    # Application launcher
    # ".config/wofi" = {
    #   source = "${configDir}/wofi";
    #   recursive = true;
    # };
    
    # Notification daemon
    # ".config/mako" = {
    #   source = "${configDir}/mako";
    #   recursive = true;
    # };
    
    # Screen locker
    # ".config/swaylock" = {
    #   source = "${configDir}/swaylock";
    #   recursive = true;
    # };
    
    # Idle management
    # ".config/swayidle" = {
    #   source = "${configDir}/swayidle";
    #   recursive = true;
    # };
    
    # Logout menu
    # ".config/wlogout" = {
    #   source = "${configDir}/wlogout";
    #   recursive = true;
    # };
    
    # System info
    # ".config/neofetch" = {
    #   source = "${configDir}/neofetch";
    #   recursive = true;
    # };
  };
  
  # XDG user directories configuration
  xdg = {
    enable = true;
    
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      templates = "$HOME/Templates";
      publicShare = "$HOME/Public";
    };
    
    # XDG MIME types (file associations)
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "text/plain" = "nvim.desktop";
        "image/png" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "video/mp4" = "mpv.desktop";
      };
    };
  };
}
