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
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
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
  -- Git
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = true
      vim.g.gitblame_message_template = "<summary> • <date> • <author>"
      vim.g.gitblame_highlight_group = "LineNr"
    end,
  },
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
  --
  { "kevinhwang91/nvim-bqf" },
  "leoluz/nvim-dap-go",
  { "olexsmir/gopher.nvim" },
  { "stevearc/aerial.nvim" },
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
    end,
  },
  -- RUST
  { "simrat39/rust-tools.nvim" },
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  --
  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = "RishabhRD/popfix",
    config = function()
      vim.g.cheat_default_window_layout = "vertical_split"
    end,
    lazy = true,
    cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
    keys = "<leader>?",
    -- disable = not lvim.builtin.cheat.active,
  },
  {
    "zbirenbaum/copilot.lua",
    -- event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
    end,
  },
  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
}
