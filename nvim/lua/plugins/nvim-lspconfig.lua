return {
  "neovim/nvim-lspconfig",
  commit = "b44737605807023d32e6310b87ba69f4dbf10e0e",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" },
    { "folke/neodev.nvim", commit = "80487e4f7bfa11c2ef2a1b461963db019aad6a73"}, -- Add vim functions to lua lsp
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    local lspconfig = require('lspconfig')

    local on_attach = function(_, bufnr)
      require('functions.keymaps').AddLspKeymaps(bufnr)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    require('neodev').setup() -- Must setup neodev before configuring lua lsp

    --
    -- Lua
    --
    lspconfig.lua_ls.setup {
      cmd = { '/opt/lua-lsp/bin/lua-language-server' },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    }

    --
    -- Cpp
    --
    lspconfig.clangd.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "c", "h", "cpp", "hpp", "inl" },
    }

    -- Disable lsp diagnostics for headers since clangd can't handle them
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      function(_, result, ctx, config)
        local ext = result.uri:match("^.+%.(.+)$")
        if ext == "hpp" or ext == "h" or ext == "inl" then
          result.diagnostics = {}
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end,
      {}
    )

    -- Set local cpp variables to purple instead of white
    vim.api.nvim_set_hl(0, '@lsp.type.variable.cpp', { link = 'NightflyPurple' })

    --
    -- Angular
    --
    lspconfig.angularls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    --
    -- Typescript
    --
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    --
    -- Python
    --
    lspconfig.pyright.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

  end,
}
