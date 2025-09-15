return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '<leader><space>',
            function()
                require('fzf-lua').files()
            end,
            desc = 'Smart Find Files',
        },
        {
            '<leader>,',
            function()
                require('fzf-lua').buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>/',
            function()
                require('fzf-lua').grep()
            end,
            desc = 'Grep',
        },

        -- find
        {
            '<C-p>',
            function()
                require('fzf-lua').files()
            end,
            desc = 'Find Files',
        },

        -- git
        {
            '<leader>gl',
            function()
                require('fzf-lua').git_commits()
            end,
            desc = 'Git Log',
        },
        {
            '<leader>gd',
            function()
                require('fzf-lua').git_diff()
            end,
            desc = 'Git Diff (Hunks)',
        },

        -- Grep
        {
            '<leader>sb',
            function()
                require('fzf-lua').curbuf()
            end,
            desc = 'Buffer Lines',
        },
        {
            '<leader>sg',
            function()
                require('fzf-lua').live_grep()
            end,
            desc = 'Live Grep',
        },
        {
            '<leader>sw',
            function()
                require('fzf-lua').grep_visual()
            end,
            desc = 'Visual selection or word',
            mode = { 'n', 'x' },
        },

        -- search
        {
            '<leader>sd',
            function()
                require('fzf-lua').diagnostics_workspace()
            end,
            desc = 'Diagnostics',
        },
        {
            '<leader>sD',
            function()
                require('fzf-lua').diagnostics_document()
            end,
            desc = 'Buffer Diagnostics',
        },
        {
            '<leader>sh',
            function()
                require('fzf-lua').helptags()
            end,
            desc = 'Help Pages',
        },
        {
            '<leader>sj',
            function()
                require('fzf-lua').jumps()
            end,
            desc = 'Jumps',
        },
        {
            '<leader>sk',
            function()
                require('fzf-lua').keymaps()
            end,
            desc = 'Keymaps',
        },
        {
            '<leader>sm',
            function()
                require('fzf-lua').marks()
            end,
            desc = 'Marks',
        },
        {
            '<leader>sq',
            function()
                require('fzf-lua').quickfix()
            end,
            desc = 'Quickfix List',
        },
        {
            '<leader>sR',
            function()
                require('fzf-lua').grep_last()
            end,
            desc = 'Resume',
        },

        -- LSP
        {
            'gd',
            function()
                require('fzf_lua').lsp_definitions()
            end,
            desc = 'Goto Definition',
        },
        {
            'gD',
            function()
                require('fzf_lua').lsp_declarations()
            end,
            desc = 'Goto Declaration',
        },
        {
            'gr',
            function()
                require('fzf_lua').lsp_references()
            end,
            nowait = true,
            desc = 'References',
        },
        {
            'gI',
            function()
                require('fzf_lua').lsp_implementations()
            end,
            desc = 'Goto Implementation',
        },
        {
            'gy',
            function()
                require('fzf_lua').lsp_type_definitions()
            end,
            desc = 'Goto T[y]pe Definition',
        },
        {
            '<leader>ss',
            function()
                require('fzf_lua').lsp_symbols()
            end,
            desc = 'LSP Symbols',
        },
        {
            '<leader>sS',
            function()
                require('fzf_lua').lsp_workspace_symbols()
            end,
            desc = 'LSP Workspace Symbols',
        },
    },
    opts = {},
}
