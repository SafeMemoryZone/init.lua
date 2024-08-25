local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("VimEnter", {
    command = "silent !tmux set status off"
})
vim.api.nvim_create_autocmd("VimLeave", {
    command = "silent !tmux set status on"
})

require("settings")
require("remap")
require("lazy").setup(require("plugins"))

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})
