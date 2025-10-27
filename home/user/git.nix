# Git and GitHub configuration
let
  userName = "jac-1";
  email = "79427501+JAC-1@users.noreply.github.com";
in
{
  programs.git = {
    enable = true;
    userName = userName;
    userEmail = email;
    
    extraConfig = {
      core = {
        editor = "nvim";
        fileMode = false;
        autocrlf = "input";
      };
      
      init = {
        defaultBranch = "main";
      };
      
      pull = {
        rebase = false;
      };
      
      push = {
        autoSetupRemote = true;
      };
      
      # Improve performance on large repos
      feature = {
        manyFiles = true;
      };
      
      # Color output
      color = {
        ui = "auto";
      };
    };
    
    # Git aliases for common operations
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    
    # Git ignore patterns (global)
    ignores = [
      "*~"
      "*.swp"
      "*.swo"
      ".DS_Store"
      ".idea/"
      ".vscode/"
      "*.log"
      "node_modules/"
      ".env"
      ".env.local"
    ];
  };
  
  # GitHub CLI
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      editor = "nvim";
    };
  };
}
