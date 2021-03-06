local M = {}

M.cursorword = function()
	vim.api.nvim_command("augroup user_plugin_cursorword")
	vim.api.nvim_command("autocmd!")
	vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
	vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
	vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
	vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
	vim.api.nvim_command("augroup END")
end

M.bfq = function()
	require("bqf").setup({
		auto_enable = true,
		preview = {
			win_height = 12,
			win_vheight = 12,
			delay_syntax = 80,
			border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
		},
		func_map = {
			vsplit = "",
			ptogglemode = "z,",
			stoggleup = "",
		},
		filter = {
			fzf = {
				action_for = { ["ctrl-s"] = "split" },
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
			},
		},
	})
end

M.diffview = function()
	-- Lua
	local cb = require("diffview.config").diffview_callback

	require("diffview").setup({
		diff_binaries = false, -- Show diffs for binaries
		file_panel = {
			width = 35,
			use_icons = true, -- Requires nvim-web-devicons
		},
		key_bindings = {
			disable_defaults = false, -- Disable the default key bindings
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			view = {
				["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
				["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
				["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
				["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
			},
			file_panel = {
				["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
				["<down>"] = cb("next_entry"),
				["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
				["<up>"] = cb("prev_entry"),
				["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
				["o"] = cb("select_entry"),
				["<2-LeftMouse>"] = cb("select_entry"),
				["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
				["S"] = cb("stage_all"), -- Stage all entries.
				["U"] = cb("unstage_all"), -- Unstage all entries.
				["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
				["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
				["<tab>"] = cb("select_next_entry"),
				["<s-tab>"] = cb("select_prev_entry"),
				["<leader>e"] = cb("focus_files"),
				["<leader>b"] = cb("toggle_files"),
			},
		},
	})
end

M.lir = function()
  local actions = require'lir.actions'
  local mark_actions = require 'lir.mark.actions'
  local clipboard_actions = require'lir.clipboard.actions'
  require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
      ['l']     = actions.edit,
      ['<Enter>'] = actions.edit,
      ['q'] = actions.quit,
      ['<Esc>'] = actions.quit,
      ['<C-s>'] = actions.split,
      ['<C-v>'] = actions.vsplit,
      ['<C-t>'] = actions.tabedit,
      ['-']     = actions.up,
      ['A']     = actions.mkdir,
      ['a']     = actions.newfile,
      ['r']     = actions.rename,
      ['Y']     = actions.yank_path,
      ['.']     = actions.toggle_show_hidden,
      ['d']     = actions.delete,
      ['J'] = function()
        mark_actions.toggle_mark()
        vim.cmd('normal! j')
      end,
      ['C'] = clipboard_actions.copy,
      ['X'] = clipboard_actions.cut,
      ['P'] = clipboard_actions.paste,
    },
  }
end

return M
