return {
  "kdheepak/lazygit.nvim",
  commit = "de35012036d43bca03628d40d083f7c02a4cda3f",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { '<leader>gg', "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit" },
    { '<leader>gf', "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit File Commits" },
    { '<leader>gc', "<cmd>LazyGitFilter<cr>", desc = "LazyGit Commits" },
  },
}
