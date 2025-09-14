local function term_nav(dir)
    return function(self)
        return self:is_floating() and '<c-' .. dir .. '>' or vim.schedule(function()
            vim.cmd.wincmd(dir)
        end)
    end
end

return {
    -- General/Basic options
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            indent = { enabled = true },
            image = { enabled = true },
            input = { enabled = true },
            notify = { enabled = true },
            notifier = { enabled = true, timeout = 3000 },
            quickfile = { enabled = true },
            scroll = {
                enabled = true,
                animate = {
                    duration = { step = 10, total = 150 },
                    easing = 'linear',
                },
            },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },

    -- Dashboard
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
  ███╗   ███╗ █████╗ ██╗  ██╗███████╗   
  ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   
  ██╔████╔██║███████║█████╔╝ █████╗     
  ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     
  ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   
  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   
     ██████╗ ██████╗  ██████╗ ██╗        
    ██╔════╝██╔═══██╗██╔═══██╗██║        
    ██║     ██║   ██║██║   ██║██║        
    ██║     ██║   ██║██║   ██║██║        
    ╚██████╗╚██████╔╝╚██████╔╝███████╗   
     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   
███████╗████████╗██╗   ██╗███████╗███████╗
██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝
███████╗   ██║   ██║   ██║█████╗  █████╗  
╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  
███████║   ██║   ╚██████╔╝██║     ██║     
╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     
                ]],
                },
            },
        },
    },

    -- Explorer
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            {
                '<C-n>',
                function()
                    require('snacks').explorer()
                end,
                desc = 'Toggle Explorer',
            },
        },
        ---@type snacks.Config
        opts = {
            explorer = {
                enabled = true,
                auto_close = true,
            },
        },
    },

    -- Scratch
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            {
                '<leader>S',
                function()
                    require('snacks').scratch()
                end,
                desc = 'Toggle Scratch Buffer',
            },
        },
        ---@type snacks.Config
        opts = {
            scratch = { enabled = true },
        },
    },

    -- Terminal
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            {
                '<C-\\>',
                function()
                    require('snacks').terminal.toggle()
                end,
                mode = { 'n', 't' },
                desc = 'Toggle Terminal',
            },
        },
        ---@type snacks.Config
        opts = {
            terminal = {
                enabled = true,
                keys = {
                    nav_h = { '<C-h>', term_nav('h'), desc = 'Go to Left Window', expr = true, mode = 't' },
                    nav_j = { '<C-j>', term_nav('j'), desc = 'Go to Lower Window', expr = true, mode = 't' },
                    nav_k = { '<C-k>', term_nav('k'), desc = 'Go to Upper Window', expr = true, mode = 't' },
                    nav_l = { '<C-l>', term_nav('l'), desc = 'Go to Right Window', expr = true, mode = 't' },
                },
            },
            words = { enabled = true },
        },
    },

    -- Lazygit
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            {
                '<leader>lg',
                function()
                    require('snacks').lazygit.open()
                end,
                desc = 'Open LazyGit',
            },
        },
        ---@type snacks.Config
        opts = {
            lazygit = { enabled = false },
        },
    },

    -- Picker
    {
        'folke/snacks.nvim',
        ---@type snacks.Config
        opts = {
            picker = { enabled = true },
        },
        keys = {
            -- Top Pickers & Explorer
            {
                '<leader><space>',
                function()
                    Snacks.picker.smart()
                end,
                desc = 'Smart Find Files',
            },
            {
                '<leader>,',
                function()
                    Snacks.picker.buffers()
                end,
                desc = 'Buffers',
            },
            {
                '<leader>/',
                function()
                    Snacks.picker.grep()
                end,
                desc = 'Grep',
            },
            {
                '<leader>n',
                function()
                    Snacks.picker.notifications()
                end,
                desc = 'Notification History',
            },

            -- find
            {
                '<leader>fb',
                function()
                    Snacks.picker.buffers()
                end,
                desc = 'Buffers',
            },
            {
                '<leader>ff',
                function()
                    Snacks.picker.files()
                end,
                desc = 'Find Files',
            },
            {
                '<C-p>',
                function()
                    Snacks.picker.files()
                end,
                desc = 'Find Files',
            },
            {
                '<leader>fp',
                function()
                    Snacks.picker.projects()
                end,
                desc = 'Projects',
            },

            -- git
            {
                '<leader>gb',
                function()
                    Snacks.picker.git_branches()
                end,
                desc = 'Git Branches',
            },
            {
                '<leader>gl',
                function()
                    Snacks.picker.git_log()
                end,
                desc = 'Git Log',
            },
            {
                '<leader>gL',
                function()
                    Snacks.picker.git_log_line()
                end,
                desc = 'Git Log Line',
            },
            {
                '<leader>gs',
                function()
                    Snacks.picker.git_status()
                end,
                desc = 'Git Status',
            },
            {
                '<leader>gS',
                function()
                    Snacks.picker.git_stash()
                end,
                desc = 'Git Stash',
            },
            {
                '<leader>gd',
                function()
                    Snacks.picker.git_diff()
                end,
                desc = 'Git Diff (Hunks)',
            },
            {
                '<leader>gf',
                function()
                    Snacks.picker.git_log_file()
                end,
                desc = 'Git Log File',
            },

            -- Grep
            {
                '<leader>sb',
                function()
                    Snacks.picker.lines()
                end,
                desc = 'Buffer Lines',
            },
            {
                '<leader>sB',
                function()
                    Snacks.picker.grep_buffers()
                end,
                desc = 'Grep Open Buffers',
            },
            {
                '<leader>sg',
                function()
                    Snacks.picker.grep()
                end,
                desc = 'Grep',
            },
            {
                '<leader>sw',
                function()
                    Snacks.picker.grep_word()
                end,
                desc = 'Visual selection or word',
                mode = { 'n', 'x' },
            },

            -- search
            {
                '<leader>s"',
                function()
                    Snacks.picker.registers()
                end,
                desc = 'Registers',
            },
            {
                '<leader>s/',
                function()
                    Snacks.picker.search_history()
                end,
                desc = 'Search History',
            },
            {
                '<leader>sc',
                function()
                    Snacks.picker.command_history()
                end,
                desc = 'Command History',
            },
            {
                '<leader>sC',
                function()
                    Snacks.picker.commands()
                end,
                desc = 'Commands',
            },
            {
                '<leader>sd',
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = 'Diagnostics',
            },
            {
                '<leader>sD',
                function()
                    Snacks.picker.diagnostics_buffer()
                end,
                desc = 'Buffer Diagnostics',
            },
            {
                '<leader>sh',
                function()
                    Snacks.picker.help()
                end,
                desc = 'Help Pages',
            },
            {
                '<leader>sj',
                function()
                    Snacks.picker.jumps()
                end,
                desc = 'Jumps',
            },
            {
                '<leader>sk',
                function()
                    Snacks.picker.keymaps()
                end,
                desc = 'Keymaps',
            },
            {
                '<leader>sm',
                function()
                    Snacks.picker.marks()
                end,
                desc = 'Marks',
            },
            {
                '<leader>sq',
                function()
                    Snacks.picker.qflist()
                end,
                desc = 'Quickfix List',
            },
            {
                '<leader>sR',
                function()
                    Snacks.picker.resume()
                end,
                desc = 'Resume',
            },
            {
                '<leader>su',
                function()
                    Snacks.picker.undo()
                end,
                desc = 'Undo History',
            },

            -- LSP
            {
                'gd',
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = 'Goto Definition',
            },
            {
                'gD',
                function()
                    Snacks.picker.lsp_declarations()
                end,
                desc = 'Goto Declaration',
            },
            {
                'gr',
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = 'References',
            },
            {
                'gI',
                function()
                    Snacks.picker.lsp_implementations()
                end,
                desc = 'Goto Implementation',
            },
            {
                'gy',
                function()
                    Snacks.picker.lsp_type_definitions()
                end,
                desc = 'Goto T[y]pe Definition',
            },
            {
                '<leader>ss',
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = 'LSP Symbols',
            },
            {
                '<leader>sS',
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = 'LSP Workspace Symbols',
            },
        },
    },
}
