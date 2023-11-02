return {
  "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000,
  commit = "06ad2689ebd251a71c6caeb9fb47e231773c9b47",
  config = function()
    vim.cmd([[colorscheme nightfly]])
  end,
}
