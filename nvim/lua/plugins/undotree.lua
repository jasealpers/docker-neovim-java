return {
  "mbbill/undotree",
  commit = "170aa9e516b6926e6bddfe21bbf01f2283a00e7d",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { '<leader>u', "<cmd>UndotreeToggle<cr>", desc = "UndoTree Toggle" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 4
  end,
}
