local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.gopls.setup({
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
