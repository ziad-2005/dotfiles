-- BOOTSTRAP FIRST (must be first line)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- NOW safe to load everything else
require("core.options")
require("core.keymaps")
require("plugins")
require("lsp")
require("ui.theme")
