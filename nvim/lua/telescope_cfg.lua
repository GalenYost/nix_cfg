local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
   defaults = {
      file_ignore_patterns = {
         "node_modules/",
         ".git/",
         "target/",
      },
   },
   pickers = {
      find_files = {
         hidden = true,
      },
   },
})

vim.keymap.set("n", "<leader><leader>", builtin.find_files, { noremap = true, silent = true })
