local flags = {
   "--files", "--hidden",
   "--glob", "!node_modules/*",
   "--glob", "!target/*",
   "--glob", "!.git/*",
}

local function files()
   local cmd = "rg " .. table.concat(flags, " ")
   return vim.split(vim.fn.system(cmd), "\n")
end

return {
   'nvim-mini/mini.nvim',
   config = function()
      local misc = require 'mini.misc'
      local comment = require 'mini.comment'
      local icons = require 'mini.icons'
      local pick = require 'mini.pick'

      misc.setup_termbg_sync()
      misc.setup_restore_cursor()

      comment.setup({
         mappings = {
            comment_line = '<leader>c',
            comment_visual = '<leader>c',
         },
      })

      icons.setup()
      icons.tweak_lsp_kind()

      pick.setup({
         window = {
            config = {
               border = 'double', -- none | single | double | rounded | shadow
            },
            style = 'minimal',
         },
      })

      vim.keymap.set(
         'n',
         '<leader>f',
         function()
            pick.start({
               source = {
                  name = 'File Search',
                  items = files(),
               },
            })
         end,
         { noremap = true, silent = true }
      )

      vim.keymap.set(
         'n',
         '<leader>g',
         pick.builtin.grep_live,
         { noremap = true, silent = true, }
      )

      vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = nil })
   end,
}
