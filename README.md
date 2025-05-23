# Home Manager for non-Nixos

Here lies my home-manager configuration, currently only suited for nonNixos system like the pop_os currently running on my laptop.

The following README is for future me, and has no guarantee to work on another system.

## Installation

Make sure you have nix:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

Then add flakes and nix-commands... which are "experimental features":

```nix
# ~/.config/nix/nix.conf

experimental-features = nix-command flakes
```

After that you are good to go with nix, and you can use it to install home-manager...

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

```

Then you can install this flake:

```bash
home-manager switch --flake .
```

## Gui Programs

Currently only Alacritty is added, but there may be more in the future. In order to run said GUI programs, one needs to install nixGL. I currently don't understand how to add it into the flake itself. I've tried a few things, but have come to no avail. Thus the best solution I have come up with is to install it manually, and make an alias to run in through the terminal. This is not an elegant solution, but it's the easiest to do for now. This also means that it is not added by default to the pop_os launcher.

### Installation

```bash
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update

nix-env -iA nixgl.auto.nixGLDefault
# nix-env -iA nixgl.auto.nixGLNvidia
# nix-env -iA nixgl.auto.nixGLBumblebee for hybrid hardware (auto detection)
# nix-env -iA nixgl.nixGLIntel

# https://github.com/nix-community/nixGL
```

## If you mess-up

Use `bfg --delete-files oops.gpg`, or `bfg --delete-folders oops/ooops/`.
Then you can clean and update the repo by doing a push (according to the bfg docs), or you can do the following:

```bash
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git push --force --all
git push --force --tags
```

THIS WILL REWRITE HISTORY, so any previous commits will be nuked and gone forever. Consider making a local backup or something just in case.

```bash
git clone --mirror <repo-url>
cd <repo-name>.git
```

## Done?

I may have missed a few things here and there.
