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
      local lspconfig = require('lspconfig')
      local cmp = require 'cmp'

      local prisma_fmt_grp = vim.api.nvim_create_augroup("PrismaFormat", { clear = true })

      local servers = {
         clangd = {},
         rust_analyzer = {},
         prismals = {},
         htmx = {},
         html = {},
         tailwindcss = {
            workspace_required = false,
         },
         ts_ls = {
            root_dir = function(fname)
               local deno = lspconfig.util.root_pattern("deno.json", "deno.json")(fname)
               if deno then return nil end
               return lspconfig.util.root_pattern("package.json")(fname)
            end,
         },
         denols = {},
         svelte = {},
         jsonls = {},
         sqlls = {},
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
               vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
         lspconfig[name].setup(cfg)
      end

      vim.api.nvim_create_autocmd("BufWritePre", {
         pattern = { "*.rs", "*.html", "*.json", "*.lua" },
         callback = function(args)
            vim.lsp.buf.format({ bufnr = args.buf, async = false })
         end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
         group = prisma_fmt_grp,
         pattern = "*.prisma",
         callback = function(args)
            vim.lsp.buf.format({
               bufnr = args.buf,
               async = false,
               filter = function(client)
                  return client.name == "prismals"
               end,
            })
         end,
      })
   end,
}
