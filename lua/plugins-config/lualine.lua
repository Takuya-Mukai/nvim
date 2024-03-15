require('lualine').setup{
  options = {
	  globalstatus = true,
    -- theme = "kanagawa",
    theme = "catppuccin",
      -- ... the rest of your lualine config 	
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    colored = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',
      { 'filename', file_status = false, path = 4, },
    },
    lualine_c = {
      {
        'diagnostics',
        source = {'nvim_lsp', 'nvim_diagnostic'},
      },
      'navic'
    },
    lualine_x = {'filetype'},
    lualine_y = {},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_c = {},
    lualine_z = {
        { 'tabs'},
    },
  },
}



