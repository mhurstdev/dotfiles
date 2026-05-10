return {
	"mhurstdev/haze.nvim",
	dev = true,
	config = function()
		require("haze").setup {
			transparent = true,
		}
		vim.cmd.colorscheme "haze"
	end,
}
