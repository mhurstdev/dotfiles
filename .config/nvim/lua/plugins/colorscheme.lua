return {
	"vimcolorschemes/olive-crt.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("olive_crt").setup {
			transparent = true
		}

		vim.cmd.colorscheme("olive-crt")
	end
}
