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
    vim.fn.sign_define('DapBreakpoint', { text = '🐞' })
    vim.fn.sign_define('DapBreakpointCondition',{ text = '🔬' })
    vim.fn.sign_define('DapStopped',{ text ='▶️' })
    vim.fn.sign_define('DapLogPoint',{ text = '📄' })

    -- This cpp debug adapter doesn't allow conditional breakpoints
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/opt/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
    }

    -- Source project specific lua files with dap configuration
    -- TODO: Need a way to reload this config after the plugin has loaded
    local config_paths = {"./.nvim-dap/nvim-dap.lua", "./.nvim-dap.lua", "./.nvim/nvim-dap.lua"}
    local project_config = ""
    for _, p in ipairs(config_paths) do
        local f = io.open(p)
        if f ~= nil then
            f:close()
            project_config = p
            break
        end
    end
    if project_config ~= "" then
      vim.notify("[nvim-dap-projects] Found nvim-dap configuration at " .. project_config, vim.log.levels.INFO, nil)
      -- require('dap').adapters = (function() return {} end)()
      require('dap').configurations = (function() return {} end)()
      vim.cmd(":luafile " .. project_config)
    end
  end,
}
