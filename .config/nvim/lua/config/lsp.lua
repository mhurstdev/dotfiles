vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local fzf_lua = require("fzf-lua")
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, opts)
		vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
		vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	end,
})

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

vim.diagnostic.config({ virtual_text = false })

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
})
