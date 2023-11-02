return {
  "mfussenegger/nvim-jdtls",
  commit = "503a399e0d0b5d432068ab5ae24b9848891b0d53",
  dependencies = { "mfussenegger/nvim-dap",
                   "rcarriga/nvim-dap-ui"},
  ft = java,
  keys =
  {
    { 'K', function() vim.lsp.buf.hover() end, desc = "Hover" },
    { 'gd', function() vim.lsp.buf.definition() end, desc = "Definition" },
    { 'gi', function() vim.lsp.buf.implementation() end, desc = "Implementation" },
    { 'gr', function() vim.lsp.buf.references() end, desc = "References" },

    { 'df', function() vim.lsp.buf.code_action() end, desc = "Code Action" },

    { '<leader>dL', function() require('dap.ext.vscode').load_launchjs(vim.api.nvim_buf_get_name(0)) end, desc = "Load Launch Config" },
    { '<leader>dd', function() require('dapui').open() end, desc = "Start Debugging" },
    { '<leader>de', function() require('dapui').close() end, desc = "Stop Debugging" },
    { '<F5>', function() require('dap').continue() end, desc = "Continue" },
    { '<F6>', function() require('dap').step_over() end, desc = "Step Over" },
    { '<F7>', function() require('dap').step_into() end, desc = "Step Into" },
    { '<F8>', function() require('dap').step_out() end, desc = "Step Out" },
    { '<leader>dt', function() require'dap'.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { '<leader>dc', function() require('dap').set_breakpoint(nil, vim.fn.input('Condition: '), nil) end, desc = "Conditional Breakpoint" },
    { '<leader>dT', function() require'dap'.clear_breakpoints() end, desc = "Clear Breakpoints" },
    -- This can include {x} to print variable x. Log messages go to the REPL, but will not be generated if the code is stepped through.
    { '<leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Log Point" },
    { '<leader>dlc', function() require('dap').set_breakpoint(nil, vim.fn.input('Condition: '), vim.fn.input('Log point message: ')) end, desc = "Conditional Log Point" },
    { '<leader>drl', function() require('dap').run_last() end, desc = "Run Last" },
    { '<leader>dor', function() require('dap').repl.open() end, desc = "REPL" },
    { '<leader>doh', function() require('dap.ui.widgets').hover() end, desc = "Hover" },
    { '<leader>dop', function() require('dap.ui.widgets').preview() end, desc = "Preview" },
    { '<leader>dof', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end, desc = "Frames" },
    { '<leader>dos', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end, desc = "Scopes" },
  }
}
