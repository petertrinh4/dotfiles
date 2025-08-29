local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
return {
    {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme "gruvbox"
	    enable_transparency()
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'gruvbox',
	}
    },
}