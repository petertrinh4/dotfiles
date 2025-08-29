# Neovim Config

This is my personal Neovim configuration, organized for easy use and sharing.

## Structure
```
init.lua
lazy-lock.json
lua/
  config/
    keybinds.lua
    lazy.lua
    options.lua
  plugins/
    colors.lua
    completion.lua
    copilot.lua
    explorer.lua
    lsp.lua
    telescope.lua
    treesitter.lua
```

## Features
- Modern color scheme and UI
- LSP support for Python, TypeScript, JavaScript, CSS, HTML, Java, C, C++
- Autocompletion and snippets
- GitHub Copilot integration
- File explorer (`nvim-tree`)
- Fuzzy finder (`telescope`)
- Syntax highlighting with Treesitter

## Usage
1. Clone this repo into your Neovim config directory:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```
2. Open Neovim and run `:Lazy sync` to install plugins.
3. Customize keybindings and plugins in the `lua/config` and `lua/plugins` folders.

## Requirements
- Neovim 0.10+
- Node.js and npm (for some language servers)
- Python (for Python LSP)
- GitHub account (for Copilot)

## License
MIT