local treesitter_setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_setup then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	indent = { enable = true }, -- enable indentation
	autotag = { enable = true }, -- enable autotagging with nvim-ts-autotag plugins
	-- ensure these language parsers are installed
	ensure_installed = {
		"python",
		"c_sharp",
		"cpp",
		"c",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	auto_install = true, -- auto install above language parsers
})

local install_setup, treesitter_install = pcall(require, "nvim-treesitter.install")
if not install_setup then
	return
end

-- to make sure that tree-sitter is using gcc
treesitter_install.compilers = { "gcc" }
