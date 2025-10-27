#!/usr/bin/env bash
# Example: How to integrate scripts with Fish shell in Home Manager

set -e

echo "=== Fish Shell Script Integration Example ==="
echo

# Method 1: Add to config.local.fish (sourced in main config)
echo "1. Creating Fish local config..."
cat > ~/.config/fish/config.local.fish << 'FISH_EOF'
# Local Fish configuration
# This file is automatically sourced by Home Manager's fish config

# Environment variables
set -gx EXAMPLE_VAR "Hello from Fish!"

# Fish-specific aliases (in addition to those in Home Manager)
alias fish-example "echo This is a Fish-specific alias"

# Custom function
function my_function
    echo "This is a custom Fish function"
end
FISH_EOF

# Method 2: Use Fish's conf.d directory (auto-sourced)
echo "2. Creating modular Fish config in conf.d/..."
mkdir -p ~/.config/fish/conf.d
cat > ~/.config/fish/conf.d/example-module.fish << 'FISH_EOF'
# Example module - automatically sourced by Fish
set -gx MODULE_VAR "loaded"

function module_function
    echo "Function from module"
end
FISH_EOF

# Method 3: Add custom functions to functions directory
echo "3. Creating custom Fish function..."
mkdir -p ~/.config/fish/functions
cat > ~/.config/fish/functions/work.fish << 'FISH_EOF'
function work
    cd ~/work
    and echo "Changed to work directory"
end
FISH_EOF

echo
echo "✓ Done! These additions will be available next time you start Fish."
echo
echo "What was created:"
echo "  - ~/.config/fish/config.local.fish (main local config)"
echo "  - ~/.config/fish/conf.d/example-module.fish (auto-sourced module)"
echo "  - ~/.config/fish/functions/work.fish (custom function)"
echo
echo "Fish automatically manages these files - they won't conflict with Home Manager!"
echo
echo "To test immediately:"
echo "  exec fish"
echo "  echo \$EXAMPLE_VAR"
