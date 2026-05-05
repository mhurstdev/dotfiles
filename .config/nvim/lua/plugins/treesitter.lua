return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require "nvim-treesitter"

		treesitter.setup {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}

		treesitter.install {
			"typescript",
			"html",
			"css",
		}
	end,
}
