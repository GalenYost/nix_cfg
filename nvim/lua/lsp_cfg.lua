local lspconfig = require('lspconfig')

local prisma_fmt_grp = vim.api.nvim_create_augroup("PrismaFormat", { clear = true })

local no_completion_caps = vim.lsp.protocol.make_client_capabilities()
no_completion_caps.textDocument.completion = nil

local servers = {
   clangd = {},
   rust_analyzer = {},
   prismals = {},
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
   lua_ls = {
      settings = {
         Lua = {
            diagnostics = { globals = { "vim" } },
         },
      },
   },
}

for name, cfg in pairs(servers) do
   cfg.capabilities = vim.tbl_deep_extend("force",
   cfg.capabilities or {},
      no_completion_caps
   )
   lspconfig[name].setup(cfg)
end

vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = "*.rs",
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
