return {
    {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
            require('window-picker').setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { 'terminal', 'quickfix' },
                    },
                },
            })
        end,
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons', -- optional, but recommended
            's1n7ax/nvim-window-picker',
        },
        lazy = false, -- neo-tree will lazily load itself
        keys = {
            {
                '<C-n>',
                '<cmd>Neotree filesystem toggle<cr>',
                mode = 'n',
                desc = 'Toggle Neotree',
            },
        },
        --@module 'neo-tree'
        --@type neotree.Config
        opts = {
            close_if_last_window = true,
            popup_border_style = '',
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                use_libuv_file_watcher = true,
            },
        },
    },
}
