require'mini.misc'.setup_termbg_sync()
require'mini.misc'.setup_restore_cursor()

require'mini.comment'.setup({
   mappings = {
      comment_line = '<leader>c',
      comment_visual = '<leader>c',
   },
})
