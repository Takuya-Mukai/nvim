return {
  -- jupytext change(ipynb -> py)
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require 'plugins-config.jupytext'
    end,
    ft = "ipynb",
    lazy = true,
  },
  --  cell run
  {
    "GCBallesteros/NotebookNavigator.nvim",
    event = "VeryLazy",
    config = function()
      require 'plugins-config.notebook-navigator'
    end,
    ft = "python",
    dependencies = {
      "GCBallesteros/jupytext.nvim",
      "echasnovski/mini.comment",
      "anuvyklack/hydra.nvim",
      {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        -- cmd = "MoltenInit",
        init = function()
          -- these are examples, not defaults. Please see the readme
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 20
          -- vim.g.molten_auto_open_output = true
          -- vim.g.molten_virt_text_output = true
          -- vim.g.molten_virt_lines_off_by_1 = true
        end,
        dependencies = {
          {
            "3rd/image.nvim",
            opts = {
              backend = "kitty", -- whatever backend you would like to use
              max_width = 100,
              max_height = 12,
              max_height_window_percentage = math.huge,
              max_width_window_percentage = math.huge,
              window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
              window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            },
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    config = function()
      require 'plugins-config.mini-hipatterns'
    end,
    opts = function()
      local nn = require "notebook-navigator"

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"

      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
}
