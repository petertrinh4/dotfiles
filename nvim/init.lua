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

-- 5. Load options
require("config.options")

-- ==========================================
-- 6. Custom Auto-Commands & File Syncing
-- ==========================================

-- Enable automatic reloading of files changed outside Neovim (Tmux window switching)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  command = "checktime",
})

-- Automatically format C/C++ files via LSP on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

