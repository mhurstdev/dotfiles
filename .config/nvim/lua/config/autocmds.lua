vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank { timeout = 50 }
	end,
})

-- Floats
local function warlock_floats()
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#a9bccb", bg = "#15232f" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#f08a1c", bg = "#15232f" })
	vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#15232f", bg = "#f08a1c", bold = true })
end

warlock_floats()

vim.api.nvim_create_autocmd("ColorScheme", { callback = warlock_floats })
