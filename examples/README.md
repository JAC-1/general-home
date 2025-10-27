
## Fish Shell Integration

Fish shell is now your primary shell in this config. Fish has a different architecture than Bash/Zsh:

### Fish Config Locations (Safe for Scripts)

1. **~/.config/fish/config.local.fish** - Main local config file (sourced by Home Manager)
2. **~/.config/fish/conf.d/** - All `.fish` files here are auto-sourced
3. **~/.config/fish/functions/** - Custom functions (auto-loaded on demand)

### Example: Adding Fish Config from Scripts

```bash
# Add environment variable
echo 'set -gx MY_VAR "value"' >> ~/.config/fish/config.local.fish

# Add alias
echo 'alias myalias "some command"' >> ~/.config/fish/config.local.fish

# Create a custom function
cat > ~/.config/fish/functions/myfunction.fish << 'FISH_EOF'
function myfunction
    echo "My custom function"
end
FISH_EOF

# Create a module in conf.d (auto-sourced)
cat > ~/.config/fish/conf.d/mymodule.fish << 'FISH_EOF'
set -gx MODULE_VAR "loaded"
FISH_EOF
```

### Fish vs Bash/Zsh Syntax

```bash
# Bash/Zsh
export VAR="value"
alias ll="ls -la"

# Fish equivalent
set -gx VAR "value"
alias ll "ls -la"
```

### NVM with Fish

For better NVM support in Fish, install the fisher plugin manager and nvm.fish:

```fish
# Install fisher (Fish plugin manager)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install nvm.fish for better Node version management
fisher install jorgebucaran/nvm.fish

# Then use nvm normally
nvm install 20
nvm use 20
```

### Your Neovim Config

Your separate nvim config repo is **NOT** managed by Home Manager, so you can update it independently:

```bash
cd ~/.config/nvim
git pull  # Update your nvim config anytime
# No need to touch home-manager!
```

If you ever want Home Manager to manage nvim, uncomment the section in `home/user/config.nix`.
