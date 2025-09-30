return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			return {
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({ capabilities = capabilities })
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")

						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							on_init = function(client)
								if client.workspace_folders then
									local path = client.workspace_folders[1].name
									if
										path ~= vim.fn.stdpath("config")
										and (
											vim.uv.fs_stat(path .. "/.luarc.json")
											or vim.uv.fs_stat(path .. "/.luarc.jsonc")
										)
									then
										return
									end
								end

								client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
									runtime = {
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								})
							end,
							settings = {
								Lua = {
									dignostics = {
										globals = {
											"vim",
										},
									},
								},
							},
						})
					end,
				},
			}
		end,
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
	},
}
