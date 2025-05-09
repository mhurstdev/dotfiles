vim.api.nvim_create_autocmd("textyankpost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})
