local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    "rust_analyzer",
    "sumneko_lua",
    "clojure_lsp",
    "elixirls",
    "ocamllsp",
    "tsserver",
    "pyright",
    "clangd",
    "gopls",
    "hls",
    "zls",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("null-ls").setup({
    sources = {
        -- formatters
        require("null-ls").builtins.formatting.yapf,
        require("null-ls").builtins.formatting.zprint,
        require("null-ls").builtins.formatting.stylua,

        -- code actions
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.code_actions.shellcheck,

        -- diagnostics
        require("null-ls").builtins.diagnostics.zsh,
        require("null-ls").builtins.diagnostics.tsc,
        require("null-ls").builtins.diagnostics.clj_kondo,
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.diagnostics.clang_check,

        -- hover
        require("null-ls").builtins.hover.dictionary,
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local border = {
    { "╔", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╗", "FloatBorder" },
    { "║", "FloatBorder" },
    { "╝", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╚", "FloatBorder" },
    { "║", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
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
                    telemetry = {
                        enable = false,
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
