-- options
vim.opt.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "no"
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
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/vague-theme/vague.nvim' },

    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',       version = 'main' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },

    { src = 'https://github.com/nvim-mini/mini.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
})

-- oil
require "oil".setup {
    default_file_explorer = true,
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    view_options = {
        show_hidden = true,
    },
}

-- colorschemes
require 'vague'.setup {
    italic = false,
}
vim.cmd.colorscheme 'vague'

-- mini
require 'mini.misc'.setup_termbg_sync()
require 'mini.misc'.setup_restore_cursor()
require 'mini.comment'.setup {
    mappings = {
        comment_line = "<leader>c",
        comment_visual = "<leader>c",
    },
}
require 'mini.pick'.setup {}

-- tree-sitter
require 'nvim-treesitter'.setup {
    ensure_installed = {
        'c', 'cpp', 'lua',
        'c_sharp', 'nu',
        'json', 'rust', 'zig',
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.enable("clangd")

vim.lsp.config("rust-analyzer", { capabilities = capabilities })
vim.lsp.enable("rust-analyzer", capabilities)

vim.lsp.config("lua-ls", { capabilities = capabilities })
vim.lsp.enable("lua-ls")

vim.lsp.config("csharp-ls", { capabilities = capabilities })
vim.lsp.enable("csharp-ls")

vim.lsp.config("jsonls", { capabilities = capabilities })
vim.lsp.enable("jsonls")

vim.lsp.config("zls", { capabilities = capabilities })
vim.lsp.enable("zls")

require "tiny-inline-diagnostic".setup {}

-- blink
require 'blink.cmp'.setup {
    keymap = {
        preset = "none",
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<C-a>'] = { 'accept' },
    },
    completion = {
        documentation = {
            auto_show = false
        }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "lua"
    }
}

-- no autocomment on new line
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_autocomment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end
})

-- dotenv highlight
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("dotenv_hl", {}),
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "dosini"
    end
})

-- formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.rs", "*.json", "*.lua", "*.c", "*.cpp", "*.h", "*.cs", "*.zig" },
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
    end,
})

-- remove search highlight on insert/cmdline enter
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
    callback = vim.schedule_wrap(function()
        vim.cmd.nohlsearch()
    end),
})

-- keymaps

-- bind nohlsearch to ESC
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch)

-- oil open parent dir
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini pickers
vim.keymap.set('n', '<leader>f', require 'mini.pick'.builtin.files, { desc = "Find files" })
vim.keymap.set('n', '<leader>g', require 'mini.pick'.builtin.grep_live)

-- lsp interactions
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)
