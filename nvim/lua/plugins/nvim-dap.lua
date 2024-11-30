return {
  "mfussenegger/nvim-dap",
  commit = "79dbc70eb79271ad801e4ff293887cde324c28d0",
  dependencies = {
    { "nvim-telescope/telescope-dap.nvim", commit = "4e2d5efb92062f0b865fe59b200b5ed7793833bf" },
    { "rcarriga/nvim-dap-ui", commit = "34160a7ce6072ef332f350ae1d4a6a501daf0159" },
    { "nvim-telescope/telescope.nvim" },
  },
  keys =
  {
    -- There are multiple ways to load debug configurations.
    -- 1) Custom ReloadDebugConfig() is a lua script. This allows interactions for prompts within nvim.
    -- 2) load_launchjs() loads a launch.json. This doesn't provide as much flexibility as #1.
    { '<leader>dR', function() require('functions.debug').ReloadDebugConfig() end, desc = "Reload Config" },
    { '<leader>dL', function() require('dap.ext.vscode').load_launchjs(vim.api.nvim_buf_get_name(0)) end, desc = "Load Launch Config" },

    { '<leader>dd', function() require('dapui').open() end, desc = "Start Debugging" },
    { '<leader>de', function() require('dapui').close() end, desc = "Stop Debugging" },
    { '<leader>dq', function() require('dap').terminate() end, desc = "Terminate Debug Session" },
    { '<F5>', function() require('dap').continue() end, desc = "Continue" },
    { '<F6>', function() require('dap').step_over() end, desc = "Step Over" },
    { '<F7>', function() require('dap').step_into() end, desc = "Step Into" },
    { '<F8>', function() require('dap').step_out() end, desc = "Step Out" },
    { '<leader>dt', function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { '<leader>dc', function() require('dap').set_breakpoint(vim.fn.input('Condition: '), nil, nil) end, desc = "Conditional Breakpoint" },
    { '<leader>dT', function() require('dap').clear_breakpoints() end, desc = "Clear Breakpoints" },

    -- This can include {x} to print variable x. Log messages go to the REPL, but will not be generated if the code is stepped through.
    { '<leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Log Point" },
    { '<leader>dlc', function() require('dap').set_breakpoint(nil, vim.fn.input('Condition: '), vim.fn.input('Log point message: ')) end, desc = "Conditional Log Point" },
    { '<leader>drl', function() require('dap').run_last() end, desc = "Run Last" },
    { '<leader>dr', function() require('dap').repl.open() end, desc = "REPL" },
    { '<leader>dj', function() require('dap').down() end, desc = "Down a Frame" },
    { '<leader>dk', function() require('dap').up() end, desc = "Up a Frame" },
    { '<leader>dh', function()
      -- Remap <Esc> to close the hover box and then delete the mapping
      -- vim.keymap.set('n', '<Esc>', function()
      --   vim.cmd([[execute "normal! \<C-W>q"]])
      --   vim.keymap.del('n', '<Esc>')
      -- end)
      require('dap.ui.widgets').hover()
    end, desc = "Hover" },
    { '<leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end, desc = "Select Frame" },
  },
  config = function()
    require('telescope').load_extension('dap')

    local dap = require('dap')
    require('dapui').setup()
    vim.fn.sign_define('DapBreakpoint', { text = '🐞' })
    vim.fn.sign_define('DapBreakpointCondition',{ text = '🔬' })
    vim.fn.sign_define('DapStopped',{ text ='▶️' })
    vim.fn.sign_define('DapLogPoint',{ text = '📄' })

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/opt/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
    }

    -- Source project specific lua files with dap configuration
    require('functions.debug').ReloadDebugConfig()

    -- Create GDB command to execute in REPL
    vim.api.nvim_create_user_command('GDB',
      function(opts)
        require('dap').repl.execute('`' .. opts.args)
      end,
      { nargs = "*" }
    )
  end,
}
