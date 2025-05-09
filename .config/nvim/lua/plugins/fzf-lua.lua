return {
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
}
