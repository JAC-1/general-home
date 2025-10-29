{
  imports = [
    ./git.nix
    ./gtk.nix
    ./shell.nix
    ./config.nix
    ./packages.nix
    ./environment.nix
    # ./nvim.nix
    ./nixvim
  ];

  # Nixpkgs configuration
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      # Permit insecure packages (add as needed)
      permittedInsecurePackages = [
        "electron-25.9.0" # Obsidian
      ];
    };
  };
  
  # Enable home-manager to manage itself
  programs.home-manager.enable = true;
}
