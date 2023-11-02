return {
  'nvim-telescope/telescope.nvim',
  commit = "4522d7e3ea75ffddabdc39957168a8a7060b5df0",
  dependencies = { 
    { 'nvim-lua/plenary.nvim', commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },
  },
  lazy = true,
  keys =
  {
    { '?f', "<cmd>Telescope find_files<CR>", desc = "Find File" },
    { '?c', "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
    { '?r', "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
    { '?b', "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { '?m', "<cmd>Telescope marks<CR>", desc = "Marks" },
    { '??', "<cmd>Telescope live_grep<CR>", desc = "Search" },

    { 'sh', "<cmd>Telescope help_tags<CR>", desc = "Search Help" },
    { 'sm', "<cmd>Telescope man_pages<CR>", desc = "Man Pages" },
    { 'sr', "<cmd>Telescope registers<CR>", desc = "Registers" },
    { 'sk', "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
    { 'sc', "<cmd>Telescope commands<CR>", desc = "Commands" },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      pickers = {
        find_files = {
          find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        },
      },
    })
  end,
}
