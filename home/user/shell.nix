{ config, pkgs, ... }:
let
  myAliases = {
    ls = "eza --icons=always";
    ll = "eza -la --icons=always";
    la = "eza -a --icons=always";
    
    # Nix utilities
    nixClean = "nix-collect-garbage --delete-old";
    homeRebuild = "home-manager switch --flake ~/Repos/general-home/ -b backup";
    hm-edit = "cd ~/Repos/general-home/ && nvim";
    
    # Development shortcuts
    fetchLazyvimConfig = "gh repo clone JAC-1/lazyvim-config ~/.config/nvim";
    imageWatch = "cd ~/Repos/Electron/image-viewer/ && npm run dev --watch";
  };
  
  # Common shell initialization for all shells
  commonShellInit = ''
    # User paths
    set -gx PATH "$HOME/.local/bin" "$HOME/bin" $PATH
    
    # Cargo/Rust
    if test -d "$HOME/.cargo/bin"
      set -gx PATH "$HOME/.cargo/bin" $PATH
    end
    
    # NVM (Node Version Manager)
    set -gx NVM_DIR "$HOME/.nvm"
    
    # Bun
    set -gx BUN_INSTALL "$HOME/.bun"
    set -gx PATH "$BUN_INSTALL/bin" $PATH
    
    # Flutter
    set -gx PATH "$HOME/development/flutter/bin" $PATH
    
    # Ollama
    set -gx OLLAMA_HOST "0.0.0.0:11434"
    
    # Terminal settings
    set -gx TERM xterm-256color
  '';
in
{
  programs = {
    # Fish shell - primary shell
    fish = {
      enable = true;
      
      shellAliases = myAliases;
      
      interactiveShellInit = ''
        # Terminal settings
        set -gx TERM xterm-256color
        
        # User paths
        set -gx PATH "$HOME/.local/bin" "$HOME/bin" $PATH
        
        # Cargo/Rust
        if test -d "$HOME/.cargo/bin"
          set -gx PATH "$HOME/.cargo/bin" $PATH
        end
        
        # NVM (Node Version Manager) - Fish version
        set -gx NVM_DIR "$HOME/.nvm"
        # Note: For fish, use fisher and nvm.fish plugin for better NVM support
        # Install with: fisher install jorgebucaran/nvm.fish
        
        # Bun
        set -gx BUN_INSTALL "$HOME/.bun"
        set -gx PATH "$BUN_INSTALL/bin" $PATH
        
        # Flutter
        set -gx PATH "$HOME/development/flutter/bin" $PATH
        
        # Ollama
        set -gx OLLAMA_HOST "0.0.0.0:11434"
        
        # Source additional fish configs from ~/.config/fish/conf.d/
        # Fish automatically sources all .fish files in conf.d/
        
        # Source user-local fish config (for manual/script additions)
        if test -f ~/.config/fish/config.local.fish
          source ~/.config/fish/config.local.fish
        end
      '';
      
      # Fish-specific functions
      functions = {
        # Custom function from your bashrc
        grok = ''
          cd ~/Repos/Grokking-Algos
          set IMAGE_NAME "grokking-python"
          set PORT "8888"
          set DIR (pwd)
          echo "🚀 Running container with Jupyter Lab..."
          sudo docker run -p 8888:8888 -v $DIR:/app $IMAGE_NAME jupyter lab --ip=0.0.0.0 --port=$PORT --allow-root --no-browser
        '';
      };
      
      plugins = [
        # Fish plugin manager - optional but recommended
        # {
        #   name = "fisher";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "jorgebucaran";
        #     repo = "fisher";
        #     rev = "4.4.4";
        #     sha256 = "sha256-example";
        #   };
        # }
      ];
    };
    
    # Bash configuration - for future use
    bash = {
      enable = true;
      shellAliases = myAliases;
      
      # Source system bashrc first
      initExtra = ''
        # Source system bashrc if it exists
        if [ -f /etc/bashrc ]; then
          . /etc/bashrc
        fi
        
        # User paths
        export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
        
        # Cargo/Rust
        if [ -f "$HOME/.cargo/env" ]; then
          . "$HOME/.cargo/env"
        fi
        
        # NVM (Node Version Manager)
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        
        # Bun
        export BUN_INSTALL="$HOME/.bun"
        export PATH="$BUN_INSTALL/bin:$PATH"
        
        # Flutter
        export PATH="$HOME/development/flutter/bin:$PATH"
        
        # Ollama
        export OLLAMA_HOST=0.0.0.0:11434
        
        # Terminal settings
        export TERM=xterm-256color
        printf '\e[2 q' # Block cursor
        
        # Source additional bashrc configs from ~/.bashrc.d/
        if [ -d ~/.bashrc.d ]; then
          for rc in ~/.bashrc.d/*; do
            if [ -f "$rc" ]; then
              . "$rc"
            fi
          done
        fi
        
        # Source user-local bash config (for manual/script additions)
        if [ -f ~/.bashrc.local ]; then
          . ~/.bashrc.local
        fi
      '';
      
      # Bash-specific settings
      historyControl = [ "ignoredups" "ignorespace" ];
      historyIgnore = [ "ls" "cd" "exit" ];
    };

    # ZSH configuration
    zsh = {
      enable = true;
      shellAliases = myAliases;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      
      initExtra = ''
        # Terminal settings
        export TERM=xterm-256color
        
        # User paths
        export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
        
        # Cargo/Rust
        if [ -f "$HOME/.cargo/env" ]; then
          . "$HOME/.cargo/env"
        fi
        
        # NVM (Node Version Manager)
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        
        # Bun
        export BUN_INSTALL="$HOME/.bun"
        export PATH="$BUN_INSTALL/bin:$PATH"
        
        # Flutter
        export PATH="$HOME/development/flutter/bin:$PATH"
        
        # Ollama
        export OLLAMA_HOST=0.0.0.0:11434
        
        # Block cursor
        printf '\e[2 q'
        
        # Source additional zsh configs from ~/.zshrc.d/
        if [ -d ~/.zshrc.d ]; then
          for rc in ~/.zshrc.d/*; do
            if [ -f "$rc" ]; then
              . "$rc"
            fi
          done
        fi
        
        # Source user-local zsh config (for manual/script additions)
        if [ -f ~/.zshrc.local ]; then
          . ~/.zshrc.local
        fi
      '';
      
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "history"
          "wd"
          "sudo"
          "command-not-found"
        ];
      };
      
      # History settings
      history = {
        size = 10000;
        save = 10000;
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
      };
    };
  };
}
