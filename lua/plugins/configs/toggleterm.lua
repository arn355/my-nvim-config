local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
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
	},
})
