return {
  "folke/which-key.nvim",
  commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
