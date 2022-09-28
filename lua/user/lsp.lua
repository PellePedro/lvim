lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = true


-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "clangd",
  "dockerls",
  "gopls",
  "jdtls",
  "pyright",
  "rust_analyzer",
  "taplo",
  "texlab",
  "tsserver",
  "yamlls",
})


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "java", "go"
}

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls", "gopls" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "codespell",
    filetypes = { "go", "javascript", "python" },
  },
  { command = "stylua", filetypes = { "lua" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "codespell",
    filetypes = { "go", "javascript", "python" },
  },
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
}
