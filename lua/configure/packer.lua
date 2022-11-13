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
	use 'jbyuki/venn.nvim'

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
