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

		-- Warlock palette ---------------------------------------------------
		local p = {
			black = "#000000",
			comment = "#5d7a92",
			fg = "#a9bccb",
			fg_bright = "#e6eef2",
			orange = "#f08a1c",
		}

		local function warlock_telescope()
			local hl = function(group, opts)
				vim.api.nvim_set_hl(0, group, opts)
			end

			-- selection uses whatever grey your CursorLine is, so they always match
			local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false }).bg
			local sel = cursorline or "#2a2a2a"

			-- every panel: black with an orange frame
			for _, part in ipairs { "", "Prompt", "Results", "Preview" } do
				hl("Telescope" .. part .. "Normal", { fg = p.fg, bg = p.black })
				hl("Telescope" .. part .. "Border", { fg = p.orange, bg = p.black })
			end
			hl("TelescopePromptNormal", { fg = p.fg_bright, bg = p.black })
			hl("TelescopePromptPrefix", { fg = p.orange, bg = p.black, bold = true })
			hl("TelescopePromptCounter", { fg = p.comment, bg = p.black })

			-- titles: prompt is a solid orange block like the tmux bar, others orange text
			hl("TelescopePromptTitle", { fg = p.black, bg = p.orange, bold = true })
			hl("TelescopeResultsTitle", { fg = p.orange, bg = p.black, bold = true })
			hl("TelescopePreviewTitle", { fg = p.orange, bg = p.black, bold = true })

			-- results
			hl("TelescopeSelection", { fg = p.fg_bright, bg = sel, bold = true })
			hl("TelescopeSelectionCaret", { fg = p.orange, bg = sel, bold = true })
			hl("TelescopeMultiSelection", { fg = p.orange, bg = p.black })
			hl("TelescopeMatching", { fg = p.orange, bold = true })
			hl("TelescopeResultsComment", { fg = p.comment })
		end

		warlock_telescope()
		-- re-apply if a colorscheme is (re)loaded after this
		vim.api.nvim_create_autocmd("ColorScheme", { callback = warlock_telescope })

		require("telescope").setup {
			defaults = {
				prompt_prefix = " ❯ ",
				selection_caret = "▍ ",
				entry_prefix = "  ",
				-- rounded corners
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				file_ignore_patterns = {
					"%.git/",
					"node_modules/",
					"dist/",
					"build/",
					"build%-storybook/",
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
					additional_args = { "--hidden" },
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
				cwd = vim.fn.stdpath "config",
			}
		end)
		vim.keymap.set("n", "<leader>pg", builtin.live_grep)
	end,
}
