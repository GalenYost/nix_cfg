return {
   "folke/noice.nvim",
   event = "VeryLazy",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
   },
   config = function()
      require("noice").setup({
         cmdline = {
            view = "cmdline_popup",
            format = {
               cmdline = { pattern = "^:", icon = ">", lang = "vim" },
               search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
               search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            },
         },
         messages = {
            enabled = true,
            view = 'notify',
         },
         popupmenu = {
            enabled = true,
         },
         lsp = {
            progress = { enabled = false },
            hover = { enabled = true },
            signature = { enabled = true },
            message = { enabled = false },
         },
         presets = {
            bottom_search = false,
            command_palette = true,
         },
         views = {
            cmdline_popup = {
               position = {
                  row = "10%",
                  col = "50%",
               },
               size = {
                  width = 40,
                  height = 1,
               },
            },
            notify = {
               size = {
                  width = 10,
                  height = 'auto',
               },
            },
         },
      })
   end
}
