require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.autocommands"
-- require "user.neoscroll"
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
require "user.aerial"
require("user.neogit")

lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.dap.active = true

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
  "gomod",
  "rust",
  "yaml",
  "json",
  "dockerfile",
}

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})


local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}

------------------------
-- Language Key Mappings
------------------------
lvim.builtin.which_key.mappings["L"] = {
  name = "Go",
  i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
  t = { "<cmd>GoMod tidy<cr>", "Tidy" },
  a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
  A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
  e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
  g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
  f = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
  c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
}

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

lvim.builtin.which_key.mappings["dT"] = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" }


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "codespell", filetypes = { "go" }, },
  { command = "staticcheck", filetypes = { "go" }, },
}
------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
}

lvim.format_on_save = {
  pattern = { "*.go" },
}


