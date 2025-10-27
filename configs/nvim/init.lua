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
require 'mini.pick'.setup()

vim.keymap.set('n', '<leader>f', function()
    require 'mini.pick'.builtin.cli({
        command = {
            'rg', '--hidden', '--files',
            '--glob', '!node_modules/*',
            '--glob', '!target/*',
            '--glob', '!.git/*'
        }
    })
end)
vim.keymap.set('n', '<leader>g', require 'mini.pick'.builtin.grep_live)

-- tree-sitter
require 'nvim-treesitter'.setup {
    ensure_installed = {
        'c', 'cpp', 'lua',
        'c_sharp', 'nu',
        'json', 'rust',
        'html', 'css', 'markdown',
    },
}

local parsers = require("nvim-treesitter.parsers")
parsers.fasm = {
    install_info = {
        url = "https://github.com/amaanq/tree-sitter-fasm",
        revision = "master",
        queries = "queries",
    },
}

vim.treesitter.language.register("fasm", { "asm" })

-- lsp
local servers = {
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rs" },
    },
    zls = {
        filetypes = { "zig" },
    },
    ccls = {
        filetypes = { "c", "cpp", "h" }
    },
    csharp_ls = {
        filetypes = { "cs" }
    },
    nushell = {
        filetypes = { "nu" }
    },
    sqlls = {
        filetypes = { "sql" }
    },
    jsonls = {
        filetypes = { "json" }
    },
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    html = {
        filetypes = { "html" },
    },
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
    pattern = { "*.rs", "*.json", "*.lua", "*.c", "*.cpp", "*.h", "*.sql", "*.zig", "*.cs" },
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
