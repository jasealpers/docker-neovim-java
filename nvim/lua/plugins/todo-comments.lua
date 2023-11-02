return {
  "folke/todo-comments.nvim",
  commit = "4a6737a8d70fe1ac55c64dfa47fcb189ca431872",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { '<leader>lt', "<CMD>TodoLocList<CR>", desc = "TODOs" },
  },
}
