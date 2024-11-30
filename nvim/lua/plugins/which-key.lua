return {
  "folke/which-key.nvim",
  commit = "9b365a6428a9633e3eeb34dbef1b791511c54f70",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
