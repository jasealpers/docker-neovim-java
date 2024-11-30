local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
  vim.cmd("wincmd p")
end

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
