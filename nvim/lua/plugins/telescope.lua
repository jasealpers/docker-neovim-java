return {
  'nvim-telescope/telescope.nvim',
  commit = "4522d7e3ea75ffddabdc39957168a8a7060b5df0",
  dependencies = {
    { 'nvim-lua/plenary.nvim', commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },
  },
  lazy = true,
  keys =
  {
    { '<leader>lc', "<cmd>Telescope colorscheme<CR>", desc = "List Colorschemes" },
    { '<leader>lf', "<cmd>Telescope oldfiles<CR>", desc = "List Recent Files" },
    { '<leader>lb', "<cmd>Telescope buffers<CR>", desc = "List Buffers" },
    { '<leader>lm', "<cmd>Telescope marks<CR>", desc = "List Marks" },
    { '<leader>lk', "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
    { '<leader>lc', "<cmd>Telescope commands<CR>", desc = "Commands" },
    { '<leader>lr', "<cmd>Telescope registers<CR>", desc = "Registers" },

    { '<leader>fh', "<cmd>Telescope help_tags<CR>", desc = "Find Help" },

    { '<leader>gt', "<cmd>Telescope git_status<CR>", desc = "Status" },
    { '<leader>gB', "<cmd>Telescope git_branches<CR>", desc = "Branches" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        n = {
          ['<c-d>'] = require('telescope.actions').delete_buffer,
          ['<c-k>'] = require('telescope.actions').cycle_history_prev,
          ['<c-j>'] = require('telescope.actions').cycle_history_next
        }, -- n
        i = {
          ['<c-d>'] = require('telescope.actions').delete_buffer,
          ['<c-k>'] = require('telescope.actions').cycle_history_prev,
          ['<c-j>'] = require('telescope.actions').cycle_history_next
        } -- i
      } -- mappings
    },
    pickers = {
      find_files = {
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
      },
    },
  },
  config = true,
}
