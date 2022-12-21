local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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
  -- packer
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
 
  if packer_bootstrap then
    require('packer').sync()
  end
end)
