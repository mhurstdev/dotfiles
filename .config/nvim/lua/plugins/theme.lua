return {
	{
		"blazkowolf/gruber-darker.nvim",
		config = function()
			vim.cmd("colorscheme gruber-darker")

			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		end
	},
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	enabled = true,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	--
	-- 		local c = require("vscode.colors").get_colors()
	--
	-- 		require("vscode").setup({
	-- 			transparent = true,
	-- 			italic_comments = true,
	-- 			underline_links = true,
	-- 			disable_nvimtree_bg = true,
	-- 			terminal_colors = true,
	-- 			color_overrides = {
	-- 				vscLineNumber = "#FFFFFF",
	-- 			},
	-- 			group_overrides = {
	-- 				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	-- 				CursorLineNr = { fg = c.vscYellow },
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme("vscode")
	-- 	end,
	-- },
}
