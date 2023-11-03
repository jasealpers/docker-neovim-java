return {
  "NeogitOrg/neogit",
  commit = "5a2d4688a80d67dc224375c78e62ffd7dc1e79e6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { "sindrets/diffview.nvim", commit = "d38c1b5266850f77f75e006bcc26213684e1e141" },
  },
  config = true,
  keys = {
    { '<leader>gg', function()
      -- TODO: When the container working directory is not a git repo, we can pass the cwd
      --       to neogit, but staging throws an error as if it's still coming from the root.
      --       For now, always bind the container to the root of the git repo and call neogit
      --       without the cwd.
      require('neogit').open()

      -- The code below finds the git repo directory which will be useful if we can figure
      -- out how to get the staging to work with cwd.

      -- Find any existing git repo root by looking for the .git directory
      -- This is empty if no .git directory was found
      -- local relative_git_repo_path = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h")..';')
    end,
    desc = "Neogit" },
  },
}
