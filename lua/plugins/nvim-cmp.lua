-- Taken from LazyVim.
-- The goal is to have a good auto-complete and editing experience that includes
-- <CR> for completion, <Tab>/<S-Tab> for cycling through completion, and context
-- awareness to prevent completion in certain scenarios.
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    keys = {
      {
        '<Tab>',
        function()
          return vim.snippet.active({ direction = 1 }) and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>'
        end,
        expr = true,
        silent = true,
        mode = { 'i', 's' },
      },
      {
        '<S-Tab>',
        function()
          return vim.snippet.active({ direction = -1 }) and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>'
        end,
        expr = true,
        silent = true,
        mode = { 'i', 's' },
      },
    },
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },

        preselect = cmp.PreselectMode.Item,

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert({
          -- Scroll the documentation window [b]ack / [f]orward.
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept the completion.
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-l>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- Accept the completion with replace functionality.
          ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),

          -- Cycle through completion menu.
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Abort completion.
          ['<C-CR>'] = function(fallback)
            cmp.abort()
            fallback()
          end,

          -- Manually trigger a completion from nvim-cmp.
          ['<C-Space>'] = cmp.mapping.complete({}),
        }),
        sources = {
          -- { name = 'lazydev', group_index = 0 },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        enabled = function()
          local context = require('cmp.config.context')
          local disabled = false
          disabled = disabled or (vim.bo.bt == 'prompt')
          disabled = disabled or (vim.fn.reg_recording() ~= '')
          disabled = disabled or (vim.fn.reg_executing() ~= '')
          disabled = disabled or context.in_treesitter_capture('comment')
          return not disabled
        end,
      })
    end,
  },

  -- auto pairs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },

  -- comments
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Better text-objects
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    opts = function()
      local ai = require('mini.ai')
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }),
          f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }), -- function
          c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }), -- class
          t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
          d = { '%f[%d]%d+' }, -- digits
          e = { -- Word with case
            { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
            '^().*()$',
          },
          u = ai.gen_spec.function_call(), -- u for "Usage"
          U = ai.gen_spec.function_call({ name_pattern = '[%w_]' }), -- without dot in function name
        },
      }
    end,
    config = function(_, opts)
      require('mini.ai').setup(opts)
    end,
  },
}
