return {
  "nvim-tree/nvim-tree.lua",
  commit = "7e3c0bee7b246ca835d5f7453db6fa19de359bab",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { '<F1>', "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" }
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- Open file in previous window
      actions = {
        open_file = {
          quit_on_open = false,
          eject = true,
          window_picker = {
            enable = true,
            picker = function ()
              -- this doesn't work if there wasn't a previous window
              return vim.fn.win_getid(vim.fn.winnr('#'))
            end,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      modified = {
        enable = true,
      },
      git = {
        ignore = false,
      },
    })
  end,
}
