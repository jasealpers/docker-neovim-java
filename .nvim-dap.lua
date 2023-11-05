local dap = require('dap')

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
dap.configurations.cpp = dap.configurations.c

dap.configurations.java = {
  {
    type = "java",
    name = "Launch Test",
    request = "launch",
    mainClass = "Test",
  },
}
