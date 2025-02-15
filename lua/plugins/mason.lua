return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local ensure_installed = {
                'rust_analyzer',
            }

            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
            })

            require('mason-lspconfig').setup_handlers({
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    local lspconfig = require('lspconfig')
                    lspconfig[server_name].setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                    })
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                ['rust_analyzer'] = function()
                    require('rust-tools').setup({})
                end,
            })
        end,
    },
}
