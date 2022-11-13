require('mason').setup({
	ui = {
		check_outdated_packages_on_open = true,
		border = 'single'
	}
})
require('mason-lspconfig').setup()

require('mason-lspconfig').setup_handlers {
	function (server_name)
		require'lspconfig'[server_name].setup{}
	end,
}
