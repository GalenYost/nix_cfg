return {
   'vyfor/cord.nvim',
   build = ":Cord update",
   name = 'cord',
   config = function()
      require 'cord'.setup({
         editor = {
            tooltip = 'God-Tier Text Editor',
         },
         display = {
            theme = "classic",
            flavor = "accent",
         },
         idle = {
            enabled = true,
            timeout = 900000,
         },
         text = {
            workspace = '',
         }
      })
   end,
}
