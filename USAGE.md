# Quick Usage Guide

## Daily Commands

```bash
# Apply configuration changes
homeRebuild

# Edit configuration
hm-edit

# Clean old generations
nixClean

# Update packages
cd ~/Repos/general-home && nix flake update && homeRebuild
```

## Adding Packages

1. Edit `home/user/packages.nix`
2. Add package name to the list (search at https://search.nixos.org)
3. Run `homeRebuild`

Example:
```nix
home.packages = with pkgs; [
  htop
  ripgrep  # Added this
];
```

## Script Integration

### Method 1: Use `.bashrc.local` or `.zshrc.local`

These files are automatically sourced and safe for scripts to modify:

```bash
# From a script
echo 'export MY_API_KEY="secret"' >> ~/.bashrc.local
echo 'alias deploy="./deploy.sh"' >> ~/.zshrc.local
```

### Method 2: Use `.bashrc.d/` or `.zshrc.d/` directories

```bash
# Create modular configs
mkdir -p ~/.bashrc.d
echo 'export WORK_ENV="production"' > ~/.bashrc.d/work.sh

mkdir -p ~/.zshrc.d  
echo 'alias k="kubectl"' > ~/.zshrc.d/kubernetes.sh
```

All files in these directories are automatically sourced!

### Method 3: Modify Home Manager directly (for permanent changes)

```bash
# Edit the nix config
cd ~/Repos/general-home
nvim home/user/shell.nix  # Add to initExtra section
homeRebuild
```

## Environment Variables

### For current session only
```bash
export MY_VAR="value"
```

### For all sessions (via script)
```bash
echo 'export MY_VAR="value"' >> ~/.bashrc.local
```

### For all sessions (via Home Manager)
Edit `home/user/environment.nix`:
```nix
home.sessionVariables = {
  MY_VAR = "value";
};
```

## Hyprland Setup

Your Hyprland configs are automatically linked from `home/config/hypr/`.

To enable Wayland utilities:

1. Edit `home/user/packages.nix`
2. Uncomment desired packages:
```nix
# wl-clipboard
# waybar
# wofi
```
3. Run `homeRebuild`

## Multiple Machine Configurations

### Create machine-specific configs

Edit `flake.nix`:
```nix
homeConfigurations = {
  justin = ...;              # Default
  justin-work = ...;         # Work machine
  justin-home = ...;         # Home machine
};
```

### Create host-specific module

Create `home/hosts/work.nix`:
```nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    slack
    zoom-us
    # Work-specific packages
  ];
}
```

Import it conditionally in `home/default.nix`.

### Switch between configs
```bash
home-manager switch --flake .#justin-work
home-manager switch --flake .#justin-home
```

## Rollback

If something breaks:
```bash
# List generations
home-manager generations

# Activate previous generation
/nix/store/<hash>-home-manager-generation/activate

# Or use the second-to-last generation
home-manager generations | head -2 | tail -1 | awk '{print $7}' | xargs -I{} {} activate
```

## Common Patterns

### Installing from unstable

Edit `home/user/packages.nix`:
```nix
{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.git              # From stable
    pkgs-unstable.neovim  # From unstable
  ];
}
```

### Adding a new dotfile directory

Edit `home/user/config.nix`:
```nix
home.file = {
  ".config/myapp" = {
    source = "${configDir}/myapp";
    recursive = true;
  };
};
```

Then create `home/config/myapp/` and put your configs there.

### Custom shell functions

Add to `~/.bashrc.local`:
```bash
# Custom function for work
grok() {
  cd ~/Repos/Grokking-Algos
  docker run -p 8888:8888 -v $(pwd):/app grokking-python
}
```

Or add to `home/user/shell.nix` in the `initExtra` section.

## Tips

- Always use `-b backup` when switching to create backups
- Test changes on a non-production machine first
- Keep `~/.bashrc.local` in version control separately if needed
- Use `nix flake check` before applying to catch errors
- Symlinks created by Home Manager should not be edited directly

## Using on NixOS

This config works on NixOS without changes!

### Standalone Mode (Recommended)
```bash
home-manager switch --flake ~/Repos/general-home#justin
```

### Integrated with NixOS System Config

Add to `/etc/nixos/configuration.nix`:
```nix
home-manager.users.justin = {
  imports = [ /home/justin/Repos/general-home/home ];
};
```

Then:
```bash
sudo nixos-rebuild switch
```

### Best Practice on NixOS

- **System config**: Hardware, services, bootloader, system packages
- **Home Manager**: User packages, dotfiles, shells, dev tools
- Keep them separate for easier management and portability

This config is designed to be portable across both NixOS and non-NixOS systems!
