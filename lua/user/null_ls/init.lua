local M = {}

M.config = function()
	local status_ok, nls = pcall(require, "null-ls")
	if not status_ok then
		return
	end

	local custom_go_actions = require("user.null_ls.go")
	local custom_md_hover = require("user.null_ls.markdown")
	local sources = {
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.cmake_format,
		nls.builtins.formatting.terraform_fmt,

		nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
		nls.builtins.formatting.black.with({ extra_args = { "--fast" }, filetypes = { "python" } }),
		nls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" }, filetypes = { "python" } }),
		nls.builtins.diagnostics.shellcheck,
		nls.builtins.diagnostics.luacheck,
		nls.builtins.diagnostics.codespell,
		nls.builtins.diagnostics.markdownlint.with({
			filetypes = { "markdown" },
		}),
		nls.builtins.diagnostics.vale.with({
			filetypes = { "markdown" },
		}),
		nls.builtins.diagnostics.golangci_lint.with({
			condition = function(utils)
				return utils.root_has_file(".golangci.yml")
			end,
		}),
		nls.builtins.code_actions.shellcheck,
		nls.builtins.code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		custom_go_actions.gomodifytags,
		custom_go_actions.gostructhelper,
		custom_md_hover.dictionary,
	}

	-- you can either config null-ls itself
	nls.setup({
		on_attach = require("lvim.lsp").common_on_attach,
		debounce = 150,
		save_after_format = false,
		sources = sources,
	})
end

return M
