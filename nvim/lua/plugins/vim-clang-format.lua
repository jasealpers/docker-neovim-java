return {
  "rhysd/vim-clang-format",
  commit = "6b791825ff478061ad1c57b21bb1ed5a5fd0eb29",
  config = function()
    vim.api.nvim_create_autocmd({ "BufWrite" }, {
      pattern = { "*.java" , "*.c", "*.h", "*.cpp", "*.hpp", "*.inl" },
      command = "ClangFormat"
    })
  end
}
