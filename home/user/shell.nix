{ config, pkgs, ... }:
let
  myAliases = {
    ls = "eza --icons=always";

    nixClean = ''
        nix-collect-garbage --delete-old
    '';
    homeRebuild = "home-manager switch --flake ~/Repos/general-home/ -b backup";
    alacritty = "nixGL alacritty";
    hm-edit = "cd ~/Repos/general-home/ && nvim";
    fetchLazyvimConfig = "gh repo clone JAC-1/lazyvim-config ~/.config/nvim";

    imageWatch = "cd ~/Repos/Electron/image-viewer/ && npm run dev --watch";


};
in
{
  programs = {
	zsh = {
    shellAliases = myAliases;
		enable = true;
		syntaxHighlighting.enable = true;
		initExtra = ''
         export TERM=xterm-256color
         # export PATH=$PATH:/usr/local/go/bin
        . "$HOME/.cargo/env"
        export PATH=$HOME/.local/bin:$PATH 
		      '';
    zplug = {
        enable = true;
        plugins = [
          {name = "zsh-users/zsh-autosuggestions";}
        ];
      };
		oh-my-zsh = {
			enable = true;
			# custom = "$HOME/.oh-my-custom";
      theme = "robbyrussell";
			plugins = [
				"git"
				"history"
				"wd"
			];
		};
	};
  };
}
