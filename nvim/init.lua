local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.api.nvim_set_keymap("i", "<C-E>", "<C-x><C-o>", { noremap = true, silent = true })
vim.keymap.set("n", "m", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.g.user_emmet_leader_key = '<C-y>'
