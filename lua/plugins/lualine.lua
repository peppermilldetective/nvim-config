-- Taken from LazyVim.
-- Was done because I couldn't get it to *not* appear in neotree, but
-- LazyVim's setup was working.
-- Oh, well. It still looks good to me.
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = ' '
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require('lualine_require')
      lualine_require.require = require

      local icons = {
        Error = ' ',
        Warn = ' ',
        Hint = ' ',
        Info = ' ',
      }

      local git_icons = {
        added = ' ',
        modified = ' ',
        removed = ' ',
      }

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = 'auto',
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter' } },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },

          lualine_c = {
            'filename',
            {
              'diagnostics',
              symbols = {
                error = icons.Error,
                warn = icons.Warn,
                info = icons.Info,
                hint = icons.Hint,
              },
            },
            'filetype',
          },
          lualine_x = {
            {
              'diff',
              symbols = {
                added = git_icons.added,
                modified = git_icons.modified,
                removed = git_icons.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return ' ' .. os.date('%R')
            end,
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }

      return opts
    end,
  },
}
