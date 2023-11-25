--lazy.nvimのセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定リリース
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { "h", mode = "c", },
    },
  },
  {
    "rebelot/kanagawa.nvim"
  },
  {
    "HiPhish/Rainbow-delimiters.nvim"
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require 'plugins/nvim-hlslens'
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function ()
      require 'plugins.nvim-scrollbar'
    end,
    VeryLazy = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    --tag = 'release',
    config = function ()
      require 'plugins.gitsigns'
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    VeryLazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons', lazy = true
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- or... tag = '0.1.1'
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    lazy = true,
    keys = { { '<leader>ff', mode = 'n' } }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' }
  },
  {
    'neovim/nvim-lspconfig',
    VeryLazy = true,
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp',
    },
    lazy = true,
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    cmd = "InsertEnter",
    config = function() require 'plugins.nvim-navic' end,
    dependencies = 'neovim/nvim-lspconfig',
  },
  {
    "SmiteshP/nvim-navbuddy",
    keys = {"<leader>nb", mode = "n"},
    config = function() require 'plugins.nvim-navbuddy' end,
    dependencies = {
      'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim',
      {
        'numToStr/Comment.nvim',
        config = function()
          require 'plugins.comment'
        end
      },
      'nvim-telescope/telescope.nvim',
    },
  },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'numToStr/Comment.nvim',
    config = function()
      require 'plugins.comment'
    end,
    cmd = 'InsertEnter',
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() require 'plugins.nvim-cmp' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        'L3MON4D3/LuaSnip',
        vesion = 'v2.*',
        run = 'make install_jsregexp',
        config = function() require 'plugins.luasnip' end,
        dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' }
      },
      {
        'zbirenbaum/copilot-cmp',
        dependencies = { 'copilot.lua' },
        config = function() require('copilot_cmp').setup() end,
        lazy = true,
      },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        copilot_node_command = 'node'
      })
    end,
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    keys = {"<leader>xx", "<leader>xw", "<leader>xd", "<leader>xq", "<leader>xl", mode = "n"},
    config = function() require 'plugins.trouble' end,
    independencies = 'nvim-tree/nvim-web-devicons',
  }

})
copilot_node_command = vim.fn.expand("$HOME") .. "/usr/local/bin/node",require("plugins/kanagawa")
require("plugins/indent-blankline")
require("plugins/lualine")
require("plugins/nvim-treesitter")
require("plugins/lps")
require("plugins/telescope")
require('plugins/hlslens')
require('plugins/nvim-tree')
require('plugins/telescope-file-browser')
require('plugins/mason')
require('plugins/nvim-lspconfig')
require('plugins/mason')
-- その他の設定
vim.wo.number = true
vim.cmd("syntax enable")
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.o.pumblend = 10
vim.opt.showmode = false
vim.wo.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.wo.relativenumber = true
vim.o.pumblend = 30
vim.wo.scrolloff = 5
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.bo.softtabstop = 2
vim.opt.laststatus = 3
vim.o.helplang = 'ja,en'
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_win_set_option(0, 'wrap', false)
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = function()
    -- 10.3.1 節で書いたコードをここに移動する
    vim.api.nvim_buf_set_option(0, 'tabstop', 2)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', 0)
    vim.api.nvim_buf_set_option(0, 'expandtab', true)
  end,
})
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
-- キーマッピング
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", ":vim", ":e ~/.config/nvim/init.lua >", { noremap = true, silent = true })
-- コマンドモードで "Vim" と入力すると、init.lua を開く
-- Don't auto-insert line break when selecting completion
vim.cmd("autocmd TermOpen * setlocal nonumber")
vim.cmd("autocmd TermOpen * setlocal norelativenumber")


vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", { noremap = true, silent = true })
