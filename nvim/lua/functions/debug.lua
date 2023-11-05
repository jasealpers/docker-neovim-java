function ReloadDebugConfig()

  -- Source project specific lua files with dap configuration
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
    require('dap').configurations = (function() return {} end)()
    vim.cmd(":luafile " .. project_config)
  end
end

return { ReloadDebugConfig = ReloadDebugConfig }
