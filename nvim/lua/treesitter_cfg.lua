require('nvim-treesitter.configs').setup {
   ensure_installed = {
      'c', 'cpp', 'lua', 'c_sharp',
      'prisma', 'svelte',
      'typescript',
      'javascript', 'json',
      'html', 'css', 'bash', 'markdown',
      'rust'
   },
   sync_install = false,
   auto_install = true,
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
}
