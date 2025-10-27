# Home Manager Configuration

This is a modular [Home Manager](https://github.com/nix-community/home-manager) configuration for managing dotfiles and user environments on **non-NixOS** Linux systems (Fedora, Omarchy, etc.).

## Features

- 🔧 **Standalone Home Manager** - Works on any Linux distribution
- 🐚 **Triple Shell Support** - Fish (primary), Bash, and Zsh with shared aliases
- 📝 **Script-Friendly** - Allows external scripts to modify configs via `.bashrc.local` and `.zshrc.local`
- 🎨 **Hyprland Ready** - Preconfigured Wayland environment variables
- 📦 **Modular Structure** - Easy to customize and maintain
- 🔄 **Stable + Unstable** - Access to both stable and bleeding-edge packages

## Structure

```
.
├── flake.nix              # Main flake configuration
├── flake.lock             # Locked dependencies
├── home/
│   ├── default.nix        # User home configuration
│   ├── user/
│   │   ├── default.nix    # Module imports
│   │   ├── shell.nix      # Bash & Zsh configuration
│   │   ├── packages.nix   # Package lists
│   │   ├── git.nix        # Git & GitHub CLI
│   │   ├── gtk.nix        # GTK theming
│   │   ├── environment.nix # Environment variables
│   │   └── config.nix     # Dotfile linking
│   └── config/            # Actual config files
│       ├── hypr/
│       ├── kitty/
│       ├── zed/
│       └── ...
```

## Prerequisites

### 1. Install Nix (with flakes enabled)

```bash
# Install Nix with flakes and nix-command enabled
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Or use the official installer with flakes
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### 2. Enable Flakes (if not already enabled)

Add to `~/.config/nix/nix.conf`:
```
experimental-features = nix-command flakes
```

### 3. Install Home Manager (standalone)

```bash
# Already included in this flake - no separate installation needed!
# The flake handles everything
```

## Installation

### First Time Setup

```bash
# Clone this repository
cd ~/Repos
git clone <your-repo-url> general-home
cd general-home

# Review and customize the configuration
nvim home/user/  # Check each .nix file

# Apply the configuration
home-manager switch --flake .#justin
```

### Updating Configuration

```bash
# After making changes
cd ~/Repos/general-home
home-manager switch --flake .#justin -b backup
```

The `-b backup` flag creates backups of existing files before replacing them.

### Update Packages

```bash
# Update flake inputs (nixpkgs, home-manager, etc.)
nix flake update

# Then apply
home-manager switch --flake .#justin
```

## Customization Guide

### Adding/Removing Packages

Edit `home/user/packages.nix`:

```nix
home.packages = with pkgs; [
  neovim
  git
  # Add your packages here
];
```

Many packages are commented out - simply uncomment what you need!

### Shell Configuration

### Fish Shell (Primary)

Fish is configured in `home/user/shell.nix` as the primary shell.

**For manual or script-based additions:**
- Create `~/.config/fish/config.local.fish` for Fish-specific additions
- Use `~/.config/fish/conf.d/` directory for modular configs (auto-sourced)
- Use `~/.config/fish/functions/` for custom functions (auto-loaded)

Example:
```bash
# Scripts can safely append to these files
echo 'set -gx MY_VAR "value"' >> ~/.config/fish/config.local.fish

# Or create modules
cat > ~/.config/fish/conf.d/mymodule.fish << 'INNER_EOF'
set -gx MODULE_VAR "loaded"
alias myalias "command"
INNER_EOF
```

Fish automatically sources all `.fish` files in `conf.d/`!

### Bash (Secondary)

Bash is also configured for compatibility when you switch.

**For manual or script-based additions:**
- Create `~/.bashrc.local` for Bash-specific additions
- Or use `~/.bashrc.d/` directory

Example:
```bash
echo 'export MY_VAR="value"' >> ~/.bashrc.local
```

### Zsh (Optional)

Zsh is available with oh-my-zsh integration.

**For manual or script-based additions:**
- Create `~/.zshrc.local` for Zsh-specific additions
- Or use `~/.zshrc.d/` directory


### Adding Aliases

Edit the `myAliases` set in `home/user/shell.nix`:

```nix
myAliases = {
  ls = "eza --icons=always";
  # Add your aliases
  myalias = "some-command";
};
```

### Environment Variables

Edit `home/user/environment.nix` for session-wide variables.

For Hyprland/Wayland settings, most are already configured!

### Linking Dotfiles

Edit `home/user/config.nix` to link configuration directories:

```nix
home.file = {
  ".config/myapp" = {
    source = "${configDir}/myapp";
    recursive = true;
  };
};
```

### Git Configuration

Edit `home/user/git.nix` to change your git username, email, or aliases.

### Theme and GTK

Edit `home/user/gtk.nix` for GTK themes, icon themes, and cursor themes.

Currently configured with Catppuccin theme - adjust as needed!

## Usage Tips

### Home Manager Commands

```bash
# Switch to new configuration
home-manager switch --flake ~/Repos/general-home#justin

# List generations
home-manager generations

# Rollback to previous generation
home-manager generations | head -2 | tail -1 | awk '{print $7}' | xargs -I{} {} activate

# Clean old generations
nix-collect-garbage --delete-old
# Or use the alias
nixClean
```

### Included Aliases

- `homeRebuild` - Rebuild and switch to new config
- `hm-edit` - Open config in nvim
- `nixClean` - Clean old Nix generations
- `ls` - Modern ls with icons (eza)
- Plus Git, Node, and development shortcuts!

### Working with Multiple Machines

You can create different configurations for different machines:

```nix
# In flake.nix
homeConfigurations = {
  justin = ...;           # Home machine
  justin-work = ...;       # Work machine (Fedora)
  justin-omarchy = ...;    # Future Omarchy setup
};
```

Then switch with:
```bash
home-manager switch --flake .#justin-work
```

### Integration with Existing Setup

This configuration is designed to **coexist** with system-installed packages:

- Home Manager packages install to `~/.nix-profile/`
- Your system PATH is preserved
- Shell configs source system defaults first
- NVM, Cargo, Bun, etc. remain functional

## Hyprland Setup

The configuration includes environment variables for Hyprland/Wayland. To use:

1. Uncomment Wayland utilities in `packages.nix` (waybar, wofi, etc.)
2. Your Hyprland config in `home/config/hypr/` will be linked automatically
3. Environment variables are already set in `environment.nix`

## Troubleshooting

### Home Manager not found

```bash
# Ensure Nix is in your PATH
source ~/.nix-profile/etc/profile.d/nix.sh

# Or add to your shell profile
echo 'source ~/.nix-profile/etc/profile.d/nix.sh' >> ~/.bashrc
```

### Flake errors

```bash
# Update flake lock
nix flake update

# Check flake
nix flake check
```

### Conflicting files

If Home Manager complains about existing files:
```bash
# Backup your files first!
mv ~/.config/kitty ~/.config/kitty.bak

# Then try again
home-manager switch --flake .#justin -b backup
```

### PATH issues

Make sure `~/.nix-profile/bin` is in your PATH:
```bash
export PATH="$HOME/.nix-profile/bin:$PATH"
```

## Additional Notes

### GUI Programs on non-NixOS

If you need to run GUI programs installed via Nix on non-NixOS systems, you may need nixGL:

```bash
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl
nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
```

Then run programs with: `nixGL <program-name>`

### Zed Editor

On some systems (especially with hybrid graphics), Zed may need discrete graphics disabled. Check `/etc/prime-discrete` and set to `off` if needed.

### If You Mess Up

Use `bfg` for cleaning git history:
```bash
bfg --delete-files secret.key
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git push --force --all
```

## Contributing

Feel free to customize this for your needs! This is your personal configuration.

### Useful Resources

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [Nixpkgs Search](https://search.nixos.org/packages)
- [Nix Pills](https://nixos.org/guides/nix-pills/)

## License

This is personal configuration - use as you wish!

## NixOS Compatibility

This configuration works on **both non-NixOS and NixOS systems** without modification!

### On NixOS

You can use this configuration in two ways:

#### Option 1: As Standalone Home Manager (Recommended for this config)

```bash
# Same as non-NixOS
home-manager switch --flake ~/Repos/general-home#justin
```

This approach keeps your user config separate from system config, making it easier to sync across machines.

#### Option 2: Import into NixOS System Configuration

In your `/etc/nixos/configuration.nix`:

```nix
{
  imports = [
    # ... other imports
    <home-manager/nixos>  # or from flake
  ];

  home-manager.users.justin = import /home/justin/Repos/general-home/home;
  
  # Or if using flakes:
  # home-manager.users.justin = inputs.home-manager.homeManagerModules.default;
}
```

Then rebuild your system:
```bash
sudo nixos-rebuild switch
```

### Differences on NixOS

When running on NixOS, some aspects work differently:

**What stays the same:**
- All shell configurations (Fish, Bash, Zsh)
- Package management via Home Manager
- Dotfile linking
- Script integration points
- Environment variables

**What might differ:**
- System packages installed via `/etc/nixos/configuration.nix` take precedence
- Some services might be better managed at system level (e.g., Hyprland)
- No need for `NIXOS_OZONE_WL` on NixOS (already set)

**Best Practice on NixOS:**
- Use system config for: system services, kernel, bootloader, hardware
- Use Home Manager for: user packages, dotfiles, shell config, dev tools
- This config works great for the Home Manager portion!

### Dual-Boot or Multi-Machine Setup

You can use the **same config** across NixOS and non-NixOS machines:

```nix
# In flake.nix
homeConfigurations = {
  justin = ...;              # Generic (works everywhere)
  justin-fedora = ...;       # Non-NixOS specific
  justin-nixos = ...;        # NixOS specific
  justin-omarchy = ...;      # Omarchy specific
};
```

The beauty of this setup is it's designed to be **portable** - it works standalone on any Linux distro including NixOS.
