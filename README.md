# Dubey Dotfiles

<p align="center">
  <img src="https://i.imgur.com/YmIuK2r.png">
</p>

## Apps configured
 - git
 - neovim
 - powerline10k
 - tmux
 - zsh

## Usage

Install GNU Stow and then simply clone this directory to your home directory via a `git clone`.

`cd` into the `.dotfiles` directory and then do `stow ...` where `...` is the "package" you want configured. For example: `stow nvim`.

## Notes
 - Worth mentioning that when installing neovim:
   - Upgrade neovim to the latest
   - Upgrade all packages
   - You might have to delete `packer_compiled.lua` in the neovim config folder and then reinstall plugins
