local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set("n", "<Tab>", ">>", opts)
keymap.set("n", "<S-Tab>", "<<", opts)
keymap.set("v", "<Tab>", ">gv", opts)
keymap.set("v", "<S-Tab>", "<gv", opts)

keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

keymap.set('n', '<leader>[', '<Cmd>bprevious<CR>', opts)
keymap.set('n', '<leader>]', '<Cmd>bnext<CR>', opts)

keymap.set('n', '<leader>q', '<Cmd>bdelete<CR>', opts)
keymap.set("n", "<leader>f", "<C-w>p", opts)

for _, mode in ipairs({"n","v","i"}) do
   vim.api.nvim_set_keymap(mode, '<Up>', '<Nop>', opts)
   vim.api.nvim_set_keymap(mode, '<Down>', '<Nop>', opts)
   vim.api.nvim_set_keymap(mode, '<Left>', '<Nop>', opts)
   vim.api.nvim_set_keymap(mode, '<Right>', '<Nop>', opts)
end

vim.api.nvim_create_autocmd("CmdlineLeave", {
   pattern = { "/", "\\?" },
   command = "nohlsearch",
})
