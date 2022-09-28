-- Additional Plugins
lvim.plugins = {
	"mfussenegger/nvim-jdtls",
	"rcarriga/nvim-dap-ui",
	"karb94/neoscroll.nvim",
	"j-hui/fidget.nvim",
	"windwp/nvim-ts-autotag",
	"kylechui/nvim-surround",
	"christianchiarulli/harpoon",
	"MattesGroeger/vim-bookmarks",
	"NvChad/nvim-colorizer.lua",
	"ghillb/cybu.nvim",
	"moll/vim-bbye",
	"folke/todo-comments.nvim",
	"windwp/nvim-spectre",
	"is0n/jaq-nvim",
	{
		"0x100101/lab.nvim",
		run = "cd js && npm ci",
	},
	"ruifm/gitlinker.nvim",
	"mattn/vim-gist",
	"mattn/webapi-vim",
	"folke/zen-mode.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"ojroques/vim-oscyank",
		config = function()
			vim.g.oscyank_term = "tmux"
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_enabled = true
			vim.g.gitblame_message_template = "<summary> • <date> • <author>"
			vim.g.gitblame_highlight_group = "LineNr"
		end,
	},
	{ "kevinhwang91/nvim-bqf" },
	"leoluz/nvim-dap-go",
	{ "ray-x/go.nvim" },
	{ "stevearc/aerial.nvim" },
	{
		"ntpeters/vim-better-whitespace",
		config = function()
			vim.g.better_whitespace_enabled = 1
			vim.g.strip_whitespace_on_save = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("user.rust-tools").config()
		end,
		ft = { "rust", "rs" },
	},
	{
		"RishabhRD/nvim-cheat.sh",
		requires = "RishabhRD/popfix",
		config = function()
			vim.g.cheat_default_window_layout = "vertical_split"
		end,
		opt = true,
		cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
		keys = "<leader>?",
		-- disable = not lvim.builtin.cheat.active,
	},
	-- https://github.com/jose-elias-alvarez/typescript.nvim
	-- "rmagatti/auto-session",
	-- "rmagatti/session-lens"
}
