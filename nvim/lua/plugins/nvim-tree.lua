return {
  "nvim-tree/nvim-tree.lua",
  commit = "7e3c0bee7b246ca835d5f7453db6fa19de359bab",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", commit = "5de460ca7595806044eced31e3c36c159a493857" },
  },
  keys = {
    { '<F1>', "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" }
  },
  config = function(_, opts)
    local nvimtree = require("nvim-tree")

    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- Avoid coloring for normal files
    vim.cmd([[ highlight! link NvimTreeExecFile Normal ]])

    -- configure nvim-tree
    nvimtree.setup(opts)
  end,
  opts = {
    view = {
      width = 60,
      relativenumber = false,
    },
    -- change folder arrow icons
    renderer = {
      highlight_git = false,
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
      custom = { ".DS_Store", "^.git$" },
    },
    modified = {
      enable = true,
    },
    git = {
      ignore = false,
    },
  },
}
