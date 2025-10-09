return {
   'neovim/nvim-lspconfig',
   dependencies = {
      'williamboman/nvim-lsp-installer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
   },
   config = function()
      local cmp = require 'cmp'

      local servers = {
         clangd = {},
         rust_analyzer = {},
         prismals = {},
         htmx = {},
         html = {},
         asm_lsp = {},
         csharp_ls = {},
         tailwindcss = {
            workspace_required = false,
         },
         ts_ls = {
            root_markers = { 'package.json' },
         },
         denols = {},
         svelte = {},
         jsonls = {},
         sqlls = {},
         nushell = {},
         lua_ls = {
            settings = {
               Lua = {
                  diagnostics = { globals = { "vim" } },
               },
            },
         },
      }

      cmp.setup({
         snippet = {
            expand = function(args)
               vim.fn["vsnip#anonymous"](args.body)
            end,
         },
         window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
         },
         mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
               else
                  fallback()
               end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
               else
                  fallback()
               end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping(function(fallback)
               if cmp.visible() and cmp.get_selected_entry() then
                  cmp.confirm({ select = false })
               else
                  fallback()
               end
            end, { "i", "s" }),
         }),
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
         }, {
            { name = 'buffer' },
         })
      })

      cmp.setup.cmdline({ '/', '?' }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         }, {
            { name = 'cmdline' }
         }),
         matching = { disallow_symbol_nonprefix_matching = false }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      for name, cfg in pairs(servers) do
         cfg.capabilities = capabilities
         vim.lsp.config(name, cfg)
         vim.lsp.enable(name)
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

      vim.api.nvim_create_autocmd("BufWritePre", {
         pattern = {
            "*.rs",
            "*.html",
            "*.json",
            "*.lua",
            "*.prisma",
            "*.c", "*.cpp", "*.h", "*.hpp"
         },
         callback = function(args)
            vim.lsp.buf.format({ bufnr = args.buf, async = false })
         end,
      })

      vim.api.nvim_create_autocmd("FileType", {
         pattern = "rust",
         callback = function()
            require('lspconfig')['tailwindcss'].manager.try_add()
         end,
      })
   end,
}
