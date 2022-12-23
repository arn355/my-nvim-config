local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- if packer not install it will install packer when open nvim

-- autocommand that will update your plugins whenever you update this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- packer (plugins manager)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- colorscheme
	use("bluz71/vim-nightfly-guicolors")

	-- tmux & spilt window navigation (Ctrl + h, j, k, l)
	use("christoomey/vim-tmux-navigator")

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	-- add, delete, change surroundings
	-- add (ys + w (motion : word) + character want to surround) (ex. ysw")
	-- delete (ds + surround character that want to delete) (ex. ds")
	-- change (cs + surround char that want to change + char that want to change to) (ex. cs"')
	use("tpope/vim-surround")

	-- replace with register content (gr + w (motion : word))
	use("inkarkat/vim-ReplaceWithRegister")

	-- commenting (gc + motion)
	-- gcc (line comment)
	-- gc9j (comment line 1 to line 9 (below))
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder (telescope)
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better telescope performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- telescope

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- lsp
	-- managing & installing lsp servers, formatters & linters
	use("williamboman/mason.nvim") -- managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap between mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc.
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- indent blankline
	use("lukas-reineke/indent-blankline.nvim") -- adds indentation guides to all lines (including empty lines)

	-- toggle terminal
	use("akinsho/toggleterm.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
