return {
   'nvim-lualine/lualine.nvim',
   name = 'lualine',
   dependencies = {
      'nvim-tree/nvim-web-devicons', name = 'devicons',
   },
   opts = {
      options = {
         icons_enabled = false,
         theme = 'auto',
         component_separators = { left = '', right = '' },
         section_separators = { left = '', right = '' },
         disabled_filetypes = {
            statusline = {},
            winbar = {},
         },
         ignore_focus = {},
         always_divide_middle = true,
         always_show_tabline = true,
         globalstatus = false,
         refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
         },
      },
      sections = {
         lualine_a = {},
         lualine_b = { 'branch' },
         lualine_c = { 'filename' },
         lualine_x = { 'location' },
         lualine_y = {},
         lualine_z = { 'progress' }
      },
      inactive_sections = {
         lualine_a = {},
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
   },
}
