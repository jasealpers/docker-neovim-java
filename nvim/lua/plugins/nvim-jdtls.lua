return {
  "mfussenegger/nvim-jdtls",
  commit = "503a399e0d0b5d432068ab5ae24b9848891b0d53",
  dependencies = {
    { "mfussenegger/nvim-dap", commit = "79dbc70eb79271ad801e4ff293887cde324c28d0" },
  },
  ft = "java",
  config = function()
    require('telescope').load_extension('dap')
  end,
}
