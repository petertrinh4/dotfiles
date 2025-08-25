return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotag = { enable = true },
	    ensure_installed = {
		"lua",
		"tsx",
		"typescript",
		"json",
		"javascript",
		"yaml",
		"css",
		"vim",
		"query",
		"c",
		"cpp",
		"java",
		"python",
		"rust",
	    },
	    auto_install = false,
	})
    end,
}