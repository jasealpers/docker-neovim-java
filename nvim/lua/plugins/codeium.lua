return {
  'Exafunction/codeium.vim',
  commit = "605ab06780c9c42a63fc8afa8c0bd02b3b51b66f",
  event = 'BufEnter',
  config = function ()
    vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
  end
}
