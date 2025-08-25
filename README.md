# Dotfiles

This repository contains my personal configuration files (dotfiles) for customizing my development environment. It includes setups for both Neovim and Kitty terminal emulator.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Configuration Details](#configuration-details)
- [License](#license)

## Features
- **Neovim**: Custom keybindings, plugins, and settings for an efficient coding workflow.
- **Kitty**: Personalized terminal appearance and behavior.

## Installation
Clone the repository:
```bash
git clone https://github.com/yourusername/dotfiles.git
```
Symlink the configuration files to your home directory:
```bash
ln -s /path/to/dotfiles/nvim ~/.config/nvim
ln -s /path/to/dotfiles/kitty ~/.config/kitty
```
Adjust the paths as needed.

## Configuration Details
### Neovim
- Main config: `nvim/init.lua`
- Plugins: `nvim/lua/plugins/`
- Keybindings & options: `nvim/lua/config/`

### Kitty
- Main config: `kitty/kitty.conf`

## License
MIT