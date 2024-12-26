return {
    {
        'ibhagwan/fzf-lua',
        dependencies = {
            {
                'junegunn/fzf',
                build = './install --bin',
            },

            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('fzf-lua').setup({})
        end,
        keys = {
            {
                '<leader>sg',
                '<cmd>FzfLua live_grep<cr>',
                'Live Grep',
            },
            {
                '<leader>sh',
                '<cmd>FzfLua helptags<cr>',
                'Search help',
            },
            {
                '<leader>sq',
                '<cmd>FzfLua quickfix<cr>',
                'Search quickfix',
            },
            {
                '<C-p>',
                '<cmd>FzfLua files<cr>',
                'Find Files',
            },
            {
                '<leader>bs',
                '<cmd>FzfLua buffers<cr>',
                'Search buffers',
            },
            {
                '<leader>sr',
                '<cmd>FzfLua lsp_references<cr>',
                'Search LSP references',
            },
            {
                '<leader>sd',
                '<cmd>FzfLua lsp_document_symbols<cr>',
                'Search document symbols',
            },
            {
                '<leader>sw',
                '<cmd>FzfLua lsp_workspace_symbols<cr>',
                'Search workspace symbols',
            },
        },
    },
}
