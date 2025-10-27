# Environment variables for Wayland/Hyprland setup
# These are optimized for running Hyprland on non-NixOS systems
{ lib, ... }:
{
  home.sessionVariables = {
    # Default applications
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "alacritty";
    
    # XDG Base Directory Specification
    XDG_CONFIG_HOME = lib.mkForce "$HOME/.config";
    XDG_DATA_HOME = lib.mkForce "$HOME/.local/share";
    XDG_STATE_HOME = lib.mkForce "$HOME/.local/state";
    XDG_CACHE_HOME = lib.mkForce "$HOME/.cache";
    
    # Wayland/Hyprland session
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    
    # Wayland-specific settings
    MOZ_ENABLE_WAYLAND = "1";           # Firefox on Wayland
    NIXOS_OZONE_WL = "1";              # Chromium/Electron apps on Wayland
    SDL_VIDEODRIVER = "wayland";        # SDL apps on Wayland
    CLUTTER_BACKEND = "wayland";        # Clutter apps on Wayland
    
    # QT settings for Wayland
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";     # Use qt5ct for theming (or "gtk3" for GTK theme)
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_SCALE_FACTOR = "1";
    
    # GTK settings
    GTK_USE_PORTAL = "1";               # Use XDG portals
    GTK_CSD = "0";                      # Disable client-side decorations
    
    # WLR (wlroots) settings for Hyprland
    WLR_NO_HARDWARE_CURSORS = "1";      # Might help with cursor issues
    WLR_RENDERER = "vulkan";            # Use Vulkan renderer
    # WLR_DRM_DEVICES = "/dev/dri/card0"; # Uncomment if needed for specific GPU
    
    # Cursor settings
    XCURSOR_SIZE = "24";                # Default cursor size
    XCURSOR_THEME = "Adwaita";          # Will be overridden by GTK settings
    
    # Portal settings (for screen sharing, file pickers, etc.)
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    
    # Additional paths (these will be appended to PATH)
    # Note: Specific paths are set in shell.nix initExtra
  };
  
  # Session variables that should be set on login
  # (These go to ~/.profile or similar)
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/bin"
  ];
}
