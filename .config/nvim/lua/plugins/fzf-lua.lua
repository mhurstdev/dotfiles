return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			"hide",
			files = {
				find_opts = [[-type f \! -path '*/.git/*' \! -path '*/node_modules/*']],
				rg_opts = [[--color=never --hidden --files -g "!.git" -g "!node_modules"]],
				fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules]],
				dir_opts = [[/s/b/a:-d]],
			},
		})
	end,
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
			"<leader>ph",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		-- {
		-- 	"<leader>fb",
		-- 	function()
		-- 		require("fzf-lua").builtin()
		-- 	end,
		-- 	desc = "[F]ind [B]uiltin FZF",
		-- },
		-- {
		-- 	"<leader>fw",
		-- 	function()
		-- 		require("fzf-lua").grep_cword()
		-- 	end,
		-- 	desc = "[F]ind current [W]ord",
		-- },
		-- {
		-- 	"<leader>fW",
		-- 	function()
		-- 		require("fzf-lua").grep_cWORD()
		-- 	end,
		-- 	desc = "[F]ind current [W]ORD",
		-- },
		-- {
		-- 	"<leader>fd",
		-- 	function()
		-- 		require("fzf-lua").diagnostics_document()
		-- 	end,
		-- 	desc = "[F]ind [D]iagnostics",
		-- },
		-- {
		-- 	"<leader>fr",
		-- 	function()
		-- 		require("fzf-lua").resume()
		-- 	end,
		-- 	desc = "[F]ind [R]esume",
		-- },
		-- {
		-- 	"<leader>fo",
		-- 	function()
		-- 		require("fzf-lua").oldfiles()
		-- 	end,
		-- 	desc = "[F]ind [O]ld Files",
		-- },
		-- {
		-- 	"<leader><leader>",
		-- 	function()
		-- 		require("fzf-lua").buffers()
		-- 	end,
		-- 	desc = "[,] Find existing buffers",
		-- },
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep the current buffer",
		},
	},
}
