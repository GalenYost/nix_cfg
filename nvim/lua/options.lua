vim.o.background = 'dark'

vim.o.number = true
vim.o.relativenumber = true

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 3
vim.o.softtabstop = 3
vim.o.tabstop = 3

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.breakindent = true
vim.o.wildignorecase = true

vim.o.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_banner = 0
vim.g.moonflyTransparent = true

if vim.fn.has('clipboard') == 1 then
  local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil
  local is_x11 = os.getenv("DISPLAY") ~= nil

  if is_wayland and vim.fn.executable('wl-copy') == 1 and vim.fn.executable('wl-paste') == 1 then
    vim.g.clipboard = {
      name = 'wl-clipboard',
      copy = {
        ['+'] = 'wl-copy',
        ['*'] = 'wl-copy',
      },
      paste = {
        ['+'] = 'wl-paste --no-newline',
        ['*'] = 'wl-paste --no-newline',
      },
      cache_enabled = 0,
    }
  elseif is_x11 and vim.fn.executable('xclip') == 1 then
    vim.g.clipboard = {
      name = 'xclip',
      copy = {
        ['+'] = 'xclip -selection clipboard',
        ['*'] = 'xclip -selection primary',
      },
      paste = {
        ['+'] = 'xclip -selection clipboard -o',
        ['*'] = 'xclip -selection primary -o',
      },
      cache_enabled = 0,
    }
  end
end

vim.cmd[[ set clipboard+=unnamedplus ]]
