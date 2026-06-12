return {
  "preservim/nerdtree",
  keys = {
    { "<C-n>", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
  },
  config = function()
    -- Add any global NERDTree settings here if needed
    -- Example: Show hidden files by default
    vim.g.NERDTreeShowHidden = 1
  end,
}

