-- options
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "no"

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.breakindent = true
vim.o.wildignorecase = true

vim.o.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- plugins
vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',       version = 'main' },
    { src = 'https://github.com/nvim-mini/mini.nvim' },
    { src = 'https://github.com/folke/snacks.nvim' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/vague-theme/vague.nvim' },
    { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },
})

-- colorscheme
require 'vague'.setup {
    italic = false,
}
vim.cmd.colorscheme 'vague'

-- mini
require 'mini.misc'.setup_termbg_sync()
require 'mini.misc'.setup_restore_cursor()
require 'mini.icons'.setup()
require 'mini.comment'.setup {
    mappings = {
        comment_line = "<leader>c",
        comment_visual = "<leader>c",
    },
}

-- snacks
require 'snacks'.setup {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
}
local opts = {
    hidden = { 'preview' },
    layout = {
        preset = 'dropdown',
    },
}

vim.keymap.set("n", "<leader>f", function()
    require 'snacks'.picker.files(opts)
end)
vim.keymap.set("n", "<leader>g", function()
    require 'snacks'.picker.grep(opts)
end)

-- tree-sitter
require 'nvim-treesitter'.setup {
    ensure_installed = {
        'c', 'cpp', 'lua',
        'c_sharp',
        'json', 'rust',
        'html', 'css', 'markdown',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- lsp
local servers = {
    rust_analyzer = {},
    zls = {},
    ccls = {},
    csharp_ls = {},
    asm_lsp = {},
    nushell = {},
    sqlls = {},
    jsonls = {},
    lua_ls = {
        cmd = { "lua-language-server" },
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    html = {},
}

for name, cfg in pairs(servers) do
    vim.lsp.config(name, cfg)
    vim.lsp.enable(name)
end

require "tiny-inline-diagnostic".setup()

-- keymap
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)

-- formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {
        "*.lua",
    },
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
    end,
})

-- blink
require 'blink.cmp'.setup {
    keymap = {
        preset = "none",
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
    },
    completion = {
        documentation = {
            auto_show = false
        }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    fuzzy = {
        implementation = "lua"
    }
}
