require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.lsp"
require "user.dap-ui"
require "user.neoscroll"
require "user.fidget"
require "user.harpoon"
require "user.cybu"
require "user.surround"
require "user.bookmark"
require "user.todo-comments"
require "user.jaq"
require "user.lab"
require "user.git"
require "user.zen-mode"
require "user.inlay-hints"
require "user.whichkey"
require "user.options"
require "user.telescope"
-- require "user.go"
require "user.dap-go"
require "user.aerial"

lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = true

-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "clangd",
  "dockerls",
  "gopls",
  "pyright",
  "rust_analyzer",
  "tsserver",
  "yamlls",
})

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "rust"
}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "go" },
  },
}
