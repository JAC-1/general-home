#!/usr/bin/env bash
# Example: How scripts can integrate with this Home Manager setup

# This script demonstrates safe ways for external scripts to modify
# shell configurations without breaking Home Manager

set -e

echo "=== Home Manager Script Integration Example ==="
echo

# Method 1: Add environment variables
echo "1. Adding environment variable to .bashrc.local..."
mkdir -p ~/.bashrc.d
echo 'export EXAMPLE_VAR="Hello from script!"' >> ~/.bashrc.local

# Method 2: Add shell aliases
echo "2. Adding alias to .zshrc.local..."
echo 'alias example-cmd="echo This is from a script-added alias"' >> ~/.zshrc.local

# Method 3: Add modular config files
echo "3. Creating modular config in .bashrc.d/..."
cat > ~/.bashrc.d/example-module.sh << 'INNER_EOF'
# Example module added by script
export SCRIPT_MODULE="loaded"

example_function() {
    echo "This function was added by a script"
}
INNER_EOF

# Method 4: Add to .zshrc.d for zsh-specific configs
echo "4. Creating zsh-specific module..."
mkdir -p ~/.zshrc.d
cat > ~/.zshrc.d/example-zsh.sh << 'INNER_EOF'
# ZSH-specific additions
setopt HIST_IGNORE_SPACE
alias zsh-example="echo ZSH specific alias"
INNER_EOF

echo
echo "✓ Done! These additions will be sourced next time you start a shell."
echo
echo "What was created:"
echo "  - ~/.bashrc.local (for bash environment variables)"
echo "  - ~/.zshrc.local (for zsh aliases)"
echo "  - ~/.bashrc.d/example-module.sh (modular bash config)"
echo "  - ~/.zshrc.d/example-zsh.sh (modular zsh config)"
echo
echo "These files are safe to modify - Home Manager will preserve them!"
