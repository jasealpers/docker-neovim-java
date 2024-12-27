return {
  "folke/which-key.nvim",
  commit = "8ab96b38a2530eacba5be717f52e04601eb59326",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
