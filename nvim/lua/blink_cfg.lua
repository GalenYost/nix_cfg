require 'blink.cmp'.setup {
   keymap = {
      preset = 'default',
      ['<Tab>'] = { 'accept', 'fallback' },
   },
   appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
   },
   sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
   },
   completion = {
      trigger = {
         prefetch_on_insert = false,
      },
      list = {
         selection = {
            auto_insert = false
         }
      }
   },
   signature = {
      enabled = true
   }
}
