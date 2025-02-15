return {
    {
        'folke/tokyonight.nvim',
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        '0xstepit/flow.nvim',
        enabled = false,
        lazy = false,
        priority = 1000,
        tag = 'v2.0.0',
        opts = {
            theme = {
                style = 'dark',
                contrast = 'high',
                transparent = false,
            },
            colors = {
                mode = 'default',
                fluo = 'pink',
            },
            ui = {
                borders = 'inverse',
                aggressive_spell = false,
            },
        },
        config = function(_, opts)
            require('flow').setup(opts)
            vim.cmd([[colorscheme flow]])
        end,
    },
    {
        'dgox16/oldworld.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            variant = 'oled',
        },
        config = function(_, opts)
            require('oldworld').setup(opts)
            vim.cmd([[colorscheme oldworld]])
        end,
    },
}
