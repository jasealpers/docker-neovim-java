return {
  "nvim-treesitter/nvim-treesitter",
  commit = "96f55f304332ca6ea1b7dde32d3ec04b5298c316",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup {
      ensure_installed = { "cpp", "cmake", "python", "lua", "java", "sql", "html", "typescript", "css" },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      }
    }

    -- Set normal variables to purple instead of white. Changes to this should change the similar setting in lspconfig
    vim.api.nvim_set_hl(0, '@variable', { link = 'NightflyPurple' })
  end
}
