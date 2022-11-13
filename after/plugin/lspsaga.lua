require('lspsaga').init_lsp_saga({
	saga_winblend = 20,
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = false,
		coache_code_action = true,
		sign = true,
		update_time = 100,
		sign_priority = 20,
		virtual_text = true,
	},
})
