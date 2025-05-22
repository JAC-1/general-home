{ config, pkgs, ... }:
let
  myAliases = {
    ls = "eza --icons=always";

    nixClean = ''
        nix-collect-garbage --delete-old
    '';
    # rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
    # fullRebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/ && home-manager switch --flake ~/.dotfiles/ -b backup";
    homeRebuild = "home-manager switch --flake ~/Repos/general-home/ -b backup";
    alacritty = "nixGL alacritty";
};
in
{
  programs = {
	zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		initExtra = ''
         export TERM=xterm-256color
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
