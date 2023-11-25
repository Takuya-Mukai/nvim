
-- Get the colors for the current theme
require('kanagawa').setup({
  compile = true,
  theme = "dragon",
  background = {
  dark = "dragon"
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },

      -- Save an hlgroup with dark background and dimmed foreground
      -- so that you can use it where your still want darker windows.
      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

      -- Popular plugins that open floats will link to NormalFloat by default;
      -- set their background accordingly if you wish to keep them dark and borderless
      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
    }
end,
})

vim.cmd("colorscheme kanagawa")
--local highlight = {
--    "RainbowRed",
--    "RainbowYellow",
--    "RainbowBlue",
--    "RainbowOrange",
--    "RainbowGreen",
--    "RainbowViolet",
--    "RainbowCyan",
--}

--local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
--hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--    vim.api.nvim_set_hl(0, "RainbowRed", { fg = palette.autumnRed })
--    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = palette.dragonYellow })
--    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = palette.dragonBlue2 })
--    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = palette.dragonOrange })
--    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = palette.dragonGreen2 })
--    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = palette.dragonPink })
--    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = palette.dragonAqua })
--end)
--
--require("ibl").setup { indent = { highlight = highlight } }

