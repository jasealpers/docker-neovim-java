--require('dap').configurations.java = {
--  {
--    type = "java",
--    request = "attach",
--    name = "Attach"
--  },
--}

-- This is a sample launch configuration
-- {
--   "version": "0.2.0",
--   "configurations": [
--     {
--       "type": "java",
--       "request": "launch",
--       "name": "Launch MyClass",
--       "mainClass": "org.sample.MyClass"
--     }
--   ]
-- }
--
-- Source this file with `lua require('dap.ext.vscode').load_launchjs(<filename>) OR
-- keymap <leader>dL while in the launch.json window

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:/root/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/root/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
    '-configuration', '/root/jdtls/config_linux',
    '-data', '/tmp'
  },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  capabilities = require('cmp_nvim_lsp').default_capabilities();
  settings = {
    java = {
      signatureHelp = {enabled = true},
      import = {enabled = true},
      rename = {enabled = true}
    }
  },
  init_options = {
    bundles = {
      vim.fn.glob("/root/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
    }
  },
}
require('jdtls').start_or_attach(config)
require('dapui').setup()
