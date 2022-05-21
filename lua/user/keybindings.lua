local M = {}

M.setup = function()
	-- ========================================
	-- keymappings

lvim.keys.normal_mode["ma"] = "<cmd>BookmarkAnnotate<cr>"
lvim.keys.normal_mode["mc"] = "<cmd>BookmarkClear<cr>"
lvim.keys.normal_mode["mm"] = "<cmd>BookmarkToggle<cr>"
lvim.keys.normal_mode["mj"] = "<cmd>BookmarkNext<cr>"
lvim.keys.normal_mode["mk"] = "<cmd>BookmarkPrev<cr>"

  -- g mapping
  vim.api.nvim_set_keymap('v', 'gy', ':OSCYank<cr>', {silent = false})

  -- Tab switch buffer
  vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

  -- Window Movement
  vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })


  vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, silent = false})
  vim.api.nvim_set_keymap('v', ';', ':', {silent = false})

  -- '\'  mapping
  vim.api.nvim_set_keymap('n', '\\1',  [[<cmd>:SymbolsOutline<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\2',  [[<cmd>:Telescope buffers<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\3',  [[<cmd>:LazyGit<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\w',  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\s',  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\r',  [[<cmd>lua vim.lsp.buf.rename()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '\\y',  [[<cmd>:OSCYank<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\t',  [[<cmd>:TroubleToggle<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '\\a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', '\\a', [[<C-^>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\l', [[<cmd>:set list!<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '\\g', [[<cmd>:G<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", '\\d',   [[<cmd>lua require('dapui').toggle()<CR>]], { noremap = true, silent = true } )
  vim.api.nvim_set_keymap("n", "<F5>",  [[<cmd>lua require('dap').continue()<CR>]] , { noremap = true, silent = false } )
  vim.api.nvim_set_keymap("n", "<F6>",  [[<cmd>lua require('dap-go').debug_test()<CR>]], { noremap = true, silent = true } )
  vim.api.nvim_set_keymap("n", "<F7>",  [[<cmd>lua require('dapui').setup()<CR>]], { noremap = true, silent = true } )
  vim.api.nvim_set_keymap("n", "<F8>",  [[<cmd>lua require('dapui').toggle()<CR>]], { noremap = true, silent = true } )
  vim.api.nvim_set_keymap("n", "<F10>", [[<cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true } )
  vim.api.nvim_set_keymap("n", "<F11>", [[<cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true } )

	-- lvim.lsp.default_keybinds = nil
	vim.cmd('nnoremap <silent> <leader>y "+y')
	vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
	vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
	vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
	vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.cmd(
		"nnoremap <silent> gl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"
	)


	-- format with prettier
	-- vim.api.nvim_set_keymap("n", "<F7>", ":!prettier --stdin-filepath % | e!<cr>", { noremap = true, silent = true })

	-- save a file every time you exit insert mode if updates were made
	-- vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>:up<CR>", { noremap = true, silent = true })

	-- close a buffer
	vim.api.nvim_set_keymap("n", "<S-x>", "<cmd>BufferClose!<CR>", { noremap = true, silent = true })

	-- Hitting escape also clears spelling and search highlights
	vim.api.nvim_set_keymap("n", "<ESC>", ":nohls | :setlocal nospell<ESC>", { noremap = true, silent = true })

	-- Yank from the current position to the end of the line
	vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

	-- When you search, center the result and open any folds
	vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })

	-- When you search backwards, center the result and open any folds
	vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

	-- Keep the cursor in the same place when joining lines
	vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })

	vim.api.nvim_set_keymap(
		"n",
		"k",
		[[(v:count > 5 ? "m'" . v:count : "") . 'k']],
		{ noremap = true, silent = true, expr = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"j",
		[[(v:count > 5 ? "m'" . v:count : "") . 'j']],
		{ noremap = true, silent = true, expr = true }
	)

	vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "Y", '"+yy', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "P", '"+P', { noremap = true, silent = true })

  -- List
  vim.cmd('set termguicolors')
  vim.cmd('set matchpairs=(:),{:},[:],<:>,`:`')
  vim.cmd('set listchars=tab:▶·,eol:¬,trail:⋅,extends:❯,precedes:❮')
  vim.cmd('set showbreak=↪')
  vim.cmd('set nolist')

  vim.api.nvim_exec([[
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
  ]], false)



end

return M
