-- 1. Set the leader key FIRST (so all plugins know it's Spacebar)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Bootstrap lazy.nvim (Downloads it if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

-- 3. Initialize lazy.nvim (Loads your plugins)
require("lazy").setup("plugins")

-- 4. Load your custom keymaps LAST
require("config.keymaps")

