return {
  "mfussenegger/nvim-dap",
  commit = "79dbc70eb79271ad801e4ff293887cde324c28d0",
  dependencies = {
    { "nvim-telescope/telescope-dap.nvim", commit = "4e2d5efb92062f0b865fe59b200b5ed7793833bf" },
    { "rcarriga/nvim-dap-ui", commit = "34160a7ce6072ef332f350ae1d4a6a501daf0159" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require('telescope').load_extension('dap')

    local dap = require('dap')
    require('dapui').setup()

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/opt/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach",
        type = "cppdbg",
        request = "attach",
        program = "/data/a.out",
        processId = function()
          return require('dap.utils').pick_process({ filter = "out" })
        end,
      },
    }

  end,
}
