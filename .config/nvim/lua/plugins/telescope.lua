return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local builtin = require "telescope.builtin"

		require("telescope").setup {
			defaults = {
				file_ignore_patterns = {
					".git",
					"node_modules",
					"dist",
					"build",
					"build-storybook",
				},
				mappings = {
					i = {
						["<C-a>"] = require("telescope.actions").select_all,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					hidden = true,
				},
			},
			extensions = {
				fzf = {},
			},
		}

		require("telescope").load_extension "fzf"

		vim.keymap.set("n", "<leader>pf", builtin.find_files)
		vim.keymap.set("n", "<leader>ph", builtin.help_tags)
		-- vim.keymap.set("n", "<leader>pv", builtin.vim_options)
		vim.keymap.set("n", "<leader>pc", function()
			builtin.find_files {
				cd = vim.fn.stdpath "config",
			}
		end)
		vim.keymap.set("n", "<leader>pg", builtin.live_grep)
	end,
}
