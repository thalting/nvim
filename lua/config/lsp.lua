local lspconfig = require("lspconfig")

local servers = {
    "rust_analyzer",
    "clojure_lsp",
    "ocamllsp",
    "pyright",
    "clangd",
    "denols",
    "lua_ls",
    "gopls",
    "hls",
    "zls",
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
}
vim.diagnostic.config({
    float = { border = "double" },
})

for _, lsp in ipairs(servers) do
    if lsp == "clangd" then
        lspconfig.clangd.setup({
            cmd = { "clangd", "--header-insertion-decorators=false" },
            capabilities = capabilities,
            handlers = handlers,
        })
    elseif lsp == "lua_ls" then
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    format = {
                        enable = false,
                    },
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
            capabilities = capabilities,
            handlers = handlers,
        })
    else
        lspconfig[lsp].setup({
            capabilities = capabilities,
            handlers = handlers,
        })
    end
end
