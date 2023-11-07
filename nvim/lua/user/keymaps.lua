local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Save with ctrl + s
keymap("n", "<C-s>", ":w<CR>", { noremap = true })

-- Open a bash terminal
keymap("n", "<leader>t", ":bo split term://bash<CR>i", { noremap = true})

-- In visual mode move text with J and K
keymap("x", "J", ":move '>+1gv-gv<CR>V", opts)
keymap("x", "K", ":move '<-2gv-gv<CR>V", opts)

-- Copy relative path with F4, usually I use this in tests
keymap("n", "<F4>", ':let @+ = fnamemodify(expand("%"), ":~:.")<CR>', opts)

-- Improve navigations in neovim windows with ctrl + neovim navigation keys
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- In insert mode go to normal mode with jk
keymap("i", "jk", "<ESC>", opts)

-- CTRL-N exits insert mode in the terminal
keymap("t", "<C-n>", [[<C-\><C-n>]], opts)

-- Zoom in/out of the current window using tabs
keymap("n", "<leader>z", "", {
  desc = "Zoom Window",
  callback = function()
    vim.cmd([[
      if tabpagewinnr(tabpagenr(), '$') > 1
        " Zoom in when this tab has more than one window
        tab split
      elseif tabpagenr('$') > 1
        " Zoom out when this tab is not the last tab
        if tabpagenr() < tabpagenr('$')
          tabclose
          tabprevious
        else
          tabclose
        endif
      endif
    ]])
  end,
  noremap = true, silent = true,
})

-- Mouse toggle for limited copy/paste
keymap("n", "<F12>", "", {
  desc = "Mouse Toggle",
  callback = function()
    vim.cmd([[
      if &mouse ==# "a"
        set mouse=r
      else
        set mouse=a
      endif
    ]])
  end,

  noremap = true, silent = true,
})

-- Add group names to which-key
require('which-key').register({
  g = { name = "Goto" },
  ["<leader>l"] = { name = "List" },
  ["<leader>g"] = { name = "Git" },
  ["<leader>d"] = { name = "Debugging",
    l = { name = "Logging Breakpoints" },
    o = { name = "Open Windows" },
    r = { name = "Run" },
  },
})
