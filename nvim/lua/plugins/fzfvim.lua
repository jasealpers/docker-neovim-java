return {
  'junegunn/fzf.vim',
  commit = "8ea9574b3ebdc44fbe3dc6381a13f9ce0c290e2f",
  dependencies = {
    { 'junegunn/fzf', commit = 'ca747a2b5465961b23aa09606412877dd482a874' }
  },
  config = function()
    vim.g.fzf_layout = {
      window = {
        width = 0.9,
        height = 0.9
      }
    }
  end,
  keys = {
    { '<leader>fs', function()
      local command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s .'
      local initial_command = string.format(command_fmt, '.')
      local reload_command = string.format(command_fmt, '{q}')
      local spec = {
        options = { '--phony', '--query', '', '--bind', 'change:reload:' .. reload_command }
      }

      vim.call('fzf#vim#grep', initial_command, 1, vim.call('fzf#vim#with_preview', spec), false)
    end, desc = "Find Symbol (via ripgrep)" },

    { '<leader>ff', function()
      vim.call('fzf#run', vim.call('fzf#wrap', {
        source = "find . -not -path '*/.*' -not -path '*-build/*' -not -path '*.o' -not -path '*.bc' -not -path '*.pyc' -type f",
        sink = 'e',
        options = '--preview="~/.local/share/nvim/lazy/fzf.vim/bin/preview.sh {}"'
      }, false))
     end, desc = "Find Files" }
  }
}
