return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		require("flash").setup({})
	end,
	keys = {
		{
			"<leader>f",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
		},
	},
}
