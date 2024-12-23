return {
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		version = "*",
		keys = {
			{
				"<leader>ga",
				function()
					require("neogen").generate()
				end,
				"[G]enerate [A]nnotations",
			},
		},
	},
}
