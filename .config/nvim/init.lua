-- Options
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.expandtab = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 1000
vim.opt.mouse = ""

-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_logiPat = 1

-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", ">", ">>_")
vim.keymap.set("n", "<", "<<_")
vim.keymap.set("n", "<leader>s-", ":split<CR><C-w>j", { silent = true })
vim.keymap.set("n", "<leader>s|", ":vsplit<CR><C-w>l", { silent = true })
vim.keymap.set("n", "Y", '"+y', { noremap = true })
vim.keymap.set("v", "Y", '"+y', { noremap = true })

-- Autocmds
vim.api.nvim_create_autocmd("textyankpost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})

-- Plugins
local plugins = {
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = "browser",
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		config = function()
			vim.cmd("colorscheme gruber-darker")
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		end
	},
	{
		"mluders/comfy-line-numbers.nvim",
		config = true
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = true,
		keys = {
			{
				"<leader>f",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					astro = { "prettier" },
					markdown = { "prettier" }
				},
				format_on_save = {
					timeout_ms = 750,
					lsp_format = "fallback",
				},
			})
		end
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
				},
				use_default_keymaps = false,
				keymaps = {
					["<CR>"] = "actions.select",
					["-"] = "actions.parent",
				},
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
				float = {
					padding = 10,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
			})

			vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
		end,
	},
	{
		{
			"mason-org/mason-lspconfig.nvim",
			opts = function()
				local capabilities = require("blink.cmp").get_lsp_capabilities()

				return {
					ensure_installed = {},
					automatic_installation = false,
					handlers = {
						function(server_name)
							require("lspconfig")[server_name].setup({ capabilities = capabilities })
						end,
						["lua_ls"] = function()
							local lspconfig = require("lspconfig")

							lspconfig.lua_ls.setup({
								capabilities = capabilities,
								on_init = function(client)
									if client.workspace_folders then
										local path = client.workspace_folders[1].name
										if
											path ~= vim.fn.stdpath("config")
											and (
												vim.uv.fs_stat(path .. "/.luarc.json")
												or vim.uv.fs_stat(path .. "/.luarc.jsonc")
											)
										then
											return
										end
									end

									client.config.settings = client.config.settings or {}
									client.config.settings.Lua = vim.tbl_deep_extend("force",
										client.config.settings.Lua or {}, {
											runtime = { version = "LuaJIT" },
											workspace = {
												checkThirdParty = false,
												library = { vim.env.VIMRUNTIME },
											},
											diagnostics = {
												globals = { "vim" },
											},
										})
								end,
								settings = {
									Lua = {
										diagnostics = {
											globals = {
												"vim",
											},
										},
									},
								},
							})
						end,
					},
				}
			end,
			dependencies = {
				{
					"mason-org/mason.nvim",
					opts = {},
				},
				"neovim/nvim-lspconfig",
			},
		},
	},
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		version = "*",
		opts = {
			keymap = { preset = "default" },
			completion = {
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "label",     "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			files = {
				find_opts = [[-type f \! -path '*/.git/*' \! -path '*/node_modules/*']],
				rg_opts = [[--color=never --hidden --files -g "!.git" -g "!node_modules"]],
				fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules]],
				dir_opts = [[/s/b/a:-d]],
			},
		},
		keys = {
			{
				"<leader>pf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files in project directory",
			},
			{
				"<leader>pg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Find by grepping in project directory",
			},
			{
				"<leader>pc",
				function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find in neovim configuration",
			},
			{
				"<leader>p.",
				function()
					require("fzf-lua").files({ cwd = os.getenv("HOME") .. "dotfiles" })
				end,
				desc = "Find in neovim configuration",
			},
			{
				"<leader>ph",
				function()
					require("fzf-lua").helptags()
				end,
				desc = "[F]ind [H]elp",
			},
			{
				"<leader>/",
				function()
					require("fzf-lua").lgrep_curbuf()
				end,
				desc = "[/] Live grep the current buffer",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {}
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				transparent_bg = true,
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				build = ":TSUpdate",
				config = function()
					local configs = require("nvim-treesitter.config")

					configs.setup({
						ensure_installed = {
							"lua",
							"vim",
							"vimdoc",
						},
						auto_install = true,
						sync_install = false,
						highlight = { enable = true },
						indent = { enable = true },

						incremental_selection = {
							enable = true,
							keymaps = {
								init_selection = "<Enter>",
								node_incremental = "<Enter>",
								scope_incremental = false,
								node_decremental = "<Backspace>",
							},
						},
					})
				end,
			},
		},
		init = function()
			local config = require("nvim-treesitter.config")
			config.setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ao"] = "@comment.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true or false
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	}
}

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)
