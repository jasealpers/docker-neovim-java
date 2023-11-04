return {
  "lewis6991/gitsigns.nvim",
  commit = "af0f583cd35286dd6f0e3ed52622728703237e50",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
  keys = {
    { '<leader>gp', function() require('gitsigns').prev_hunk() end, desc = "Previous Hunk" },
    { '<leader>gn', function() require('gitsigns').next_hunk() end, desc = "Next Hunk" },
    { '<leader>gs', function() require('gitsigns').stage_hunk() end, desc = "Stage Hunk" },
    { '<leader>gu', function() require('gitsigns').undo_stage_hunk() end, desc = "Undo Stage Hunk" },
    { '<leader>gr', function() require('gitsigns').reset_hunk() end, desc = "Reset Hunk" },
    { '<leader>gS', function() require('gitsigns').stage_buffer() end, desc = "Stage Buffer" },
    { '<leader>gR', function() require('gitsigns').reset_buffer_index() end, desc = "Reset Buffer" },
    { '<leader>gb', function() require('gitsigns').blame_line() end, desc = "Blame Line" },
    { '<leader>gv', function() require('gitsigns').preview_hunk_inline() end, desc = "Preview Hunk" },
    { '<leader>gd', function() require('gitsigns').diffthis() vim.cmd("wincmd p") end, desc = "Diff" },
  },
}
