-- Clear search highlights with <Leader>h
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })

-- Fast window navigation using Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Safe way to define Telescope keymaps
local builtin_status, builtin = pcall(require, "telescope.builtin")
if builtin_status then
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
end

