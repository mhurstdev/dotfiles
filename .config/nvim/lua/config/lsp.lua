vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("terraformls", {
	filetypes = { "terraform" },
	init_options = {
		ignoreSingleFileWarning = true,
	},
})
