--lazy.nvimのセットアップ
vim.loader.enable()

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

<<<<<<< HEAD

require('lazy').setup({
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { "h", mode = "c", },
    },
  },
  {
    "catppuccin/nvim", name = 'catppuccin', priority = 1000,
    config = function()
      require 'plugins.catppuccin'
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require 'plugins/kanagawa'
  --   end,
  --   -- event = "BufEnter",
  -- },
  {
    "HiPhish/Rainbow-delimiters.nvim",
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
  -- {
  --   'kevinhwang91/nvim-hlslens',
  --   keys = {"/", mod = "n"},
  --   config = function()
  --     require 'plugins/nvim-hlslens'
  --   end,
  -- },
  {
    'petertriho/nvim-scrollbar',
    config = function ()
      require 'plugins.nvim-scrollbar'
    end,
    event = "BufEnter",
  },
  {
    'lewis6991/gitsigns.nvim',
    --tag = 'release',
    config = function ()
      require 'plugins.gitsigns'
    end,
    event = "BufEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
      require 'plugins/indent-blankline'
    end,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = "BufWinEnter",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require 'plugins.nvim-treesitter' end,
    event = "BufWinEnter",
    build = ":TSUpdate",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require 'plugins.lualine'
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', lazy = true
    },
    event = "BufWinEnter",
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- or... tag = '0.1.1'
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    lazy = true,
    keys = {'<leader>ff', mode = 'n'},
    config = function() require 'plugins.telescope' end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    keys = {'<leader><leader>', mode = 'n'},
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function() require 'plugins.nvim-tree' end,
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
    keys = { { '<leader>ex', mode = 'n' } },
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
  --   },
  --   lazy = true,
  --   key = { "<space>fb", mode = "n" },
  --   config = function() require 'plugins.telescope-file-browser' end,
  -- },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
    keys = { { '<leader>ex', mode = 'n' } },
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      {'neovim/nvim-lspconfig', config = function() require 'plugins.nvim-lspconfig' end},
    },
    -- lazy = true,
    -- cmd = {
    --   "Mason",
    --   "MasonInstall",
    --   "MasonUninstall",
    --   "MasonUninstallAll",
    --   "MasonLog",
    --   "MasonUpdate",
    -- },
    config = function() require 'plugins.mason' end,
  },
  {
    'neovim/nvim-lspconfig',
    -- event = "BufEnter",
    config = function() require 'plugins.nvim-lspconfig' end,
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
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim', 'numToStr/Comment.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'numToStr/Comment.nvim',
    event = "BufWinEnter",
    config = function()
      require 'plugins.comment'
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    config = function() require 'plugins.nvim-cmp' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      dependencies =
      {
        {
          'L3MON4D3/LuaSnip',
          vesion = 'v2.*',
          build = 'make install_jsregexp',
          config = function() require 'plugins.luasnip' end,
          dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' }
        },
        {
          'zbirenbaum/copilot-cmp',
          dependencies = 'copilot.lua',
          config = function() require('copilot_cmp').setup() end,
          lazy = true,
        },
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
      },
    }
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
  },
  {
    'dccsillag/magma-nvim',
    build = ':UpdateRemotePlugins'
  },
  {
    'mfussenegger/nvim-dap', config = function() require 'plugins.nvim-dap' end,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function() require 'plugins.dapui' end,
    event = "BufEnter",
    -- keys = {'<leader>d', '<F5>', mode = 'n'},
    dependencies = {{
        "folke/neodev.nvim", opts = {},
        config = function() require 'plugins/neodev' end,
      },
      "nvim-dap",
    },
  },
  {
    'https://github.com/mfussenegger/nvim-dap-python',
    config = function() require 'plugins/dap-python' end,
    ft = 'python',
    dependencies = 'mfussenegger/nvim-dap',
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    cmd = {
      "WhichKey",
    },
    opts = {},
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
    config = function() require 'plugins.fidget' end,
  },
  {
    'rcarriga/nvim-notify',
    ops = {},
    config = function() require 'plugins.nvim-notify' end,
    dependencies = 'rebelot/kanagawa.nvim',
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      handlers = {}
    },
  },
=======
require("lazy").setup({
	{
		"vim-jp/vimdoc-ja",
		lazy = true,
		keys = {
			{ "h", mode = "c" },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugins.catppuccin")
		end,
	},
	-- {
	--   "rebelot/kanagawa.nvim",
	--   config = function()
	--     require 'plugins/kanagawa'
	--   end,
	--   -- event = "BufEnter",
	-- },
	{
		"HiPhish/Rainbow-delimiters.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	-- {
	--   'kevinhwang91/nvim-hlslens',
	--   keys = {"/", mod = "n"},
	--   config = function()
	--     require 'plugins/nvim-hlslens'
	--   end,
	-- },
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("plugins.nvim-scrollbar")
		end,
		event = "BufEnter",
	},
	{
		"lewis6991/gitsigns.nvim",
		--tag = 'release',
		config = function()
			require("plugins.gitsigns")
		end,
		event = "BufEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("plugins/indent-blankline")
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = "BufWinEnter",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.nvim-treesitter")
		end,
		event = "BufWinEnter",
		build = ":TSUpdate",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			lazy = true,
		},
		event = "BufWinEnter",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x", -- or... tag = '0.1.1'
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		lazy = true,
		keys = { "<leader>ff", mode = "n" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		keys = { "<leader><leader>", mode = "n" },
		dependencies = "nvim-telescope/telescope.nvim",
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
		keys = { { "<leader>ex", mode = "n" } },
	},
	-- {
	--   "nvim-telescope/telescope-file-browser.nvim",
	--   dependencies = {
	--     "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
	--   },
	--   lazy = true,
	--   key = { "<space>fb", mode = "n" },
	--   config = function() require 'plugins.telescope-file-browser' end,
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
		keys = { { "<leader>ex", mode = "n" } },
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			{
				"neovim/nvim-lspconfig",
				config = function()
					require("plugins.nvim-lspconfig")
				end,
			},
		},
		-- lazy = true,
		-- cmd = {
		--   "Mason",
		--   "MasonInstall",
		--   "MasonUninstall",
		--   "MasonUninstallAll",
		--   "MasonLog",
		--   "MasonUpdate",
		-- },
		config = function()
			require("plugins.mason")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		-- event = "BufEnter",
		config = function()
			require("plugins.nvim-lspconfig")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		cmd = "InsertEnter",
		config = function()
			require("plugins.nvim-navic")
		end,
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		"SmiteshP/nvim-navbuddy",
		keys = { "<leader>nb", mode = "n" },
		config = function()
			require("plugins.nvim-navbuddy")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugins.comment")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		config = function()
			require("plugins.nvim-cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					vesion = "v2.*",
					build = "make install_jsregexp",
					config = function()
						require("plugins.luasnip")
					end,
					dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
				},
				{
					"zbirenbaum/copilot-cmp",
					dependencies = "copilot.lua",
					config = function()
						require("copilot_cmp").setup()
					end,
					lazy = true,
				},
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				copilot_node_command = "node",
			})
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		keys = { "<leader>xx", "<leader>xw", "<leader>xd", "<leader>xq", "<leader>xl", mode = "n" },
		config = function()
			require("plugins.trouble")
		end,
		independencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"dccsillag/magma-nvim",
		build = ":UpdateRemotePlugins",
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.nvim-dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("plugins.dapui")
		end,
		event = "BufEnter",
		-- keys = {'<leader>d', '<F5>', mode = 'n'},
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
				config = function()
					require("plugins/neodev")
				end,
			},
			"nvim-dap",
		},
	},
	{
		"https://github.com/mfussenegger/nvim-dap-python",
		config = function()
			require("plugins/dap-python")
		end,
		ft = "python",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"folke/which-key.nvim",
		lazy = true,
		cmd = {
			"WhichKey",
		},
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
		config = function()
			require("plugins.fidget")
		end,
	},
	{
		"rcarriga/nvim-notify",
		ops = {},
		config = function()
			require("plugins.nvim-notify")
		end,
		dependencies = "rebelot/kanagawa.nvim",
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			handlers = {},
		},
	},
>>>>>>> 792c944 (formatted)
})

-- その他の設定
vim.api.nvim_set_option_value("termguicolors", true, { scope = "global" })
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
vim.o.helplang = "ja,en"
vim.api.nvim_set_option_value("signcolumn", "yes:1", {})
vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})
vim.api.nvim_set_option_value("wrap", false, {})
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
--   pattern = '*',
--   callback = function()
-- 10.3.1 節で書いたコードをここに移動する
vim.api.nvim_set_option_value("tabstop", 2, {})
vim.api.nvim_set_option_value("shiftwidth", 2, {})
vim.api.nvim_set_option_value("expandtab", true, {})
--   end,
-- })
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
-- キーマッピング
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "<leader>vim", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
-- コマンドモードで "Vim" と入力すると、init.lua を開く
-- Don't auto-insert line break when selecting completion
vim.cmd("autocmd TermOpen * setlocal nonumber")
vim.cmd("autocmd TermOpen * setlocal norelativenumber")
