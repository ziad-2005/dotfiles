vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>ya", "ggyG", { desc = "Yank entire file" })
local on_attach = function(client, bufnr)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show diagnostics' })
end
