local opts = {
  settings = {
    gopls = {
      gofumpt = true, -- A stricter gofmt
      -- codelenses = {
      --   gc_details = true, -- Toggle the calculation of gc annotations
      --   generate = true, -- Runs go generate for a given directory
      --   regenerate_cgo = true, -- Regenerates cgo definitions
      --   test = true,
      --   tidy = false, -- Runs go mod tidy for a module
      --   upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
      --   vendor = false, -- Runs go mod vendor for a module
      -- },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      diagnosticsDelay = "300ms",
      experimentalWatchedFileDelay = "100ms",
      symbolMatcher = "fuzzy",
      completeUnimported = true,
      staticcheck = true,
      matcher = "Fuzzy",
      usePlaceholders = true, -- enables placeholders for function parameters or struct fields in completion responses
      -- analyses = {
      --   fieldalignment = true, -- find structs that would use less memory if their fields were sorted
      --   nilness = true, -- check for redundant or impossible nil comparisons
      --   shadow = true, -- check for possible unintended shadowing of variables
      --   unusedparams = true, -- check for unused parameters of functions
      --   unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
      -- },
    },
  },
}

require("lvim.lsp.manager").setup("gopls", opts)

-- local status_ok, nls = pcall(require, "null-ls")
-- if not status_ok then
--   return
-- end


-- local sources = {
--   nls.builtins.formatting.goimports,
--   nls.builtins.diagnostics.codespell,
-- }

-- nls.setup {
--   on_attach = require("lvim.lsp").common_on_attach,
--   debounce = 150,
--   save_after_format = false,
--   sources = sources,
-- }
