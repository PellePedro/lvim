M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

keymap(
	"n",
	"<F6>",
	[[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
	opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	"<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<s-tab>",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
	opts
)

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

keymap("n", "\\a", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
keymap("n", "\\1", [[<cmd>:AerialToggle<CR>]], opts)
keymap("n", "\\2", [[<cmd>:Telescope buffers<CR>]], opts)
-- keymap('n', '\\e', [[<cmd>:Neotree reveal toggle<CR>]], opts)
keymap("n", "\\e", [[<cmd>:NvimTreeToggle<CR>]], opts)
keymap("n", "\\t", [[<cmd>:TroubleToggle<CR>]], opts)
keymap("n", "\\r", [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
keymap("v", "\\y", [[<cmd>:OSCYank<CR>]], opts)
keymap("n", "\\t", [[<cmd>:TroubleToggle<CR>]], opts)

keymap("n", "\\f", [[<cmd>:set foldmethod=indent<CR>]], opts)
keymap("n", "\\b", [[<cmd>:GoBreakToggle<CR>]], opts)
keymap("n", "\\d", [[<cmd>:GoDebug<CR>]], opts)
keymap("n", "\\x", [[<cmd>:GoDbgStop<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '\\a', [[<C-^>]], { noremap = true, silent = true })
keymap("n", "\\l", [[<cmd>:set list!<CR>]], opts)
keymap(
	"n",
	"\\w",
	[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]],
	opts
)
keymap(
	"n",
	"\\s",
	[[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
	opts
)

keymap("v", "gy", ":OSCYank<cr>", { silent = false })

-- When you search, center the result and open any folds
keymap("n", "n", "nzzzv", opts)

-- When you search backwards, center the result and open any folds
keymap("n", "N", "Nzzzv", opts)

-- Keep the cursor in the same place when joining lines
keymap("n", "J", "mzJ`z", opts)

keymap("n", "y", '"+y', opts)
keymap("n", "Y", '"+yy', opts)
keymap("n", "p", '"+p', opts)
keymap("n", "P", '"+P', opts)

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

return M
