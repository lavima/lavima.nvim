-- Luarocks libs
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- Bootstrap lazy plugin manager 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {})


-- Indent
vim.opt.smartindent = true
vim.opt.expandtab = trues
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Search 
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrapscan = true

-- Line numbering
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'number'

-- Theme
vim.cmd[[colorscheme catppuccin]]

