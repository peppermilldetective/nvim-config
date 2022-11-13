local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- MUST BE FIRST
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	use 'Shatur/neovim-ayu'

	-- FZF
	use {
		'junegunn/fzf',
		run = './install --bin',
	}
	use 'junegunn/fzf.vim'
	use {
		'ibhagwan/fzf-lua',
		requires = {'kyazdani42/nvim-web-devicons'},
	}

	-- Autocomplete
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		requires = {
			{'ms-jpq/coq.artifacts', branch = 'artifacts'},
			{'ms-jpq/coq.thirdparty', branch = '3p'},
		},
	}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'ojroques/nvim-lspfuzzy',
		requires = {
			{'junegunn/fzf'},
			{'junegunn/fzf.vim'},
		},
	}
	use {
		'glepnir/lspsaga.nvim',
		branch = 'main',
	}
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'nvim-lua/lsp-status.nvim'

	use 'folke/lsp-colors.nvim'
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('trouble').setup {
				height = 15,
				auto_close = true,
			}
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Neo-tree
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
	}

	-- Git
	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}
	
	-- Crates Management (Rust)
	use {
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		requires = {'nvim-lua/plenary.nvim'},
		config = function()
			require('crates').setup()
		end,
	}

	-- Tabline
	use {
		'noib3/nvim-cokeline',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			local get_hex = require('cokeline/utils').get_hex

			require('cokeline').setup({
				default_hl = {
				  fg = function(buffer)
					return
					  buffer.is_focused
					  and get_hex('Normal', 'fg')
					   or get_hex('Comment', 'fg')
				  end,
				  bg = 'NONE',
				},

				components = {
					{
						text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
						fg = get_hex('Normal', 'fg')
					},
					{
						text = function(buffer) return '    ' .. buffer.devicon.icon end,
						fg = function(buffer) return buffer.devicon.color end,
					},
					{
						text = function(buffer) return buffer.filename .. '    ' end,
						style = function(buffer) return buffer.is_focused and 'bold' or nil end,
					},
					{
						text = '',
						delete_buffer_on_left_click = true,
					},
					{
						text = '  ',
					},
				},
			})
		end
	}
	use {
		'utilyre/barbecue.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'smiteshp/nvim-navic',
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require('barbecue').setup()
		end,
	}

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {
				options = { theme = require'lualine.themes.ayu_dark' }
			}
		end,
	}

	-- Misc
	use {
		'jbyuki/venn.nvim',
		config = function()
			function _G.Toggle_venn()
				local venn_enabled = vim.inspect(vim.b.venn_enabled)
				if venn_enabled == "nil" then
					vim.b.venn_enabled = true
					vim.cmd[[setlocal ve=all]]
					-- draw a line on HJKL keystrokes
					vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
					vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
					vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
					vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
					-- draw a box by pressing "f" with visual selection
					vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
				else
					vim.cmd[[setlocal ve=]]
					vim.cmd[[mapclear <buffer>]]
					vim.b.venn_enabled = nil
				end
			end
			--toggle keymappings for venn
			vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", {noremap = true})
			vim.api.nvim_set_keymap('v', '<leader>b', ":VBox<CR>", {noremap = true})
		end
	}

	use {
		'sudormrfbin/cheatsheet.nvim',

		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	}

	use 'lukas-reineke/indent-blankline.nvim'

	-- Automatically setup configuration after cloning packer.nvim
	-- MUST BE AT THE END
	if packer_bootstrap then
		require('packer').sync()
	end
end)
