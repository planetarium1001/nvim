return {
    "williamboman/mason-lspconfig.nvim",
    dependenice = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason-lspconfig').setup({
          -- Replace the language servers listed here 
          -- with the ones you want to install
          ensure_installed = {'lua_ls', 'rust_analyzer', 'pylsp'},
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          },
        })

    end
}
