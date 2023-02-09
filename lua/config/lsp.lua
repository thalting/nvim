local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    "rust_analyzer",
    "sumneko_lua",
    "clojure_lsp",
    "ocamllsp",
    "pyright",
    "clangd",
    "denols",
    "gopls",
    "hls",
    "zls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
}

for _, lsp in ipairs(servers) do
    if lsp == "sumneko_lua" then
        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
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
