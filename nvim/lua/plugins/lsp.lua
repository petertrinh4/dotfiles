return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
        
            lspconfig.pyright.setup{}
            lspconfig.ts_ls.setup{}
            lspconfig.html.setup{}
            lspconfig.cssls.setup{}
            lspconfig.jdtls.setup{}
            lspconfig.clangd.setup{}
        end
    },
}