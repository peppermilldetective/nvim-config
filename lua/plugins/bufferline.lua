-- Config taken from LazyVim.
return {
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            {
                'H',
                '<cmd>BufferLineCyclePrev<cr>',
                'Previous Buffer',
            },
            {
                'L',
                '<cmd>BufferLineCycleNext<cr>',
                'Next Buffer',
            },
        },
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diag)
                    local icons = {
                        Error = ' ',
                        Warn = ' ',
                        Hint = ' ',
                        Info = ' ',
                    }
                    local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        text_align = 'left',
                    },
                },
                extensions = {
                    'neo-tree',
                    'lazy',
                },
            },
        },
        config = function(_, opts)
            require('bufferline').setup(opts)
            -- Fix bufferline when restoring a session
            vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
}
