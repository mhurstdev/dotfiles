return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})

			vim.cmd("colorscheme carbonfox")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},
	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("eldritch").setup({
	-- 			transparent = true,
	-- 			terminal_colors = true,
	-- 			styles = {
	-- 				sidebars = "dark",
	-- 				floats = "dark",
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme("eldritch")
	-- 	end,
	-- },
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
