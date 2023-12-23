require('telescope').setup {
  lazy = true,
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
    winblend = 20,
  },
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/takuyamuk/.config",
        ["data"]    = "/home/takuyamuk/.local/share",
        ["project"] = "/home/takuyamuk/projects",
        ["wiki"]    = "/home/takuyamuk/wiki"
      }
    }
  },
}
require('telescope').load_extension('fzf')
local themes = require 'telescope.themes'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<C-l>', builtin.diagnostics)
vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags(themes.get_ivy())
end)
