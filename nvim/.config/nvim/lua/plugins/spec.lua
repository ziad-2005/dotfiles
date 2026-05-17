return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "onsails/lspkind.nvim" },
  {
  "uloco/bluloco.nvim",
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
    vim.opt.termguicolors = true
    vim.cmd("colorscheme bluloco")
  end,
},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
}
