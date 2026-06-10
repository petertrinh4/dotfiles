return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8', -- Sets a stable release version
    dependencies = { 
        'nvim-lua/plenary.nvim' -- Essential utility dependency
    },
    config = function()
        -- Initialize Telescope with standard defaults
        require('telescope').setup({})
    end
}

