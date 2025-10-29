{
  description = "Justin's home-manager config for non-NixOS systems";

  inputs = {
    # Nixpkgs stable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    # Nixpkgs unstable for latest packages
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Home Manager (release 24.11 - stable)
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # NixVim for Neovim configuration
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      
      # Helper function to create pkgs with overlays
      mkPkgs = nixpkgs: system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
      
      pkgs = mkPkgs nixpkgs system;
      pkgs-unstable = mkPkgs nixpkgs-unstable system;
      
    in
    {
      # Home Manager configuration for standalone (non-NixOS) systems
      homeConfigurations = {
        # Main user configuration
        justin = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          modules = [ 
            ./home
            nixvim.homeManagerModules.nixvim
          ];
          
          # Extra arguments passed to all modules
          extraSpecialArgs = {
            inherit pkgs-unstable inputs;
          };
        };
      };
      
      # Optional: Development shell for working on this config
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          home-manager
          git
          nixpkgs-fmt
        ];
        
        shellHook = ''
          echo "Home Manager development shell"
          echo "Run 'home-manager switch --flake .#justin' to apply config"
        '';
      };
    };
}
