local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-t>]], -- keybinding that use to toggle terminal (Ctrl + t)
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	close_on_exit = true,
	direction = "float",
	-- if you don't use window change this to vim.o.shell
	shell = "pwsh.exe", -- change the default shell to powershell
	float_opts = {
		border = "curved",
		-- width and height for floating terminal
		width = 100,
		height = 80,
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0, noremap = true }
	-- in terminal mode user <esc> or jk to enter normal mode
	vim.keymap.set("t", "<esc>", [[<C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

-- can toggle lazygit in normal and terminal mode
vim.keymap.set("n", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
