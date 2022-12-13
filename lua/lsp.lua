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

require("mason-lspconfig").setup({
    ensure_installed = {
        -- lsps
        "rust_analyzer",
        "sumneko_lua",
        "clojure_lsp",
        "elixirls",
        "ocamllsp",
        "tsserver",
        "pyright",
        "gopls",
        "zls",
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
        })
    else
        lspconfig[lsp].setup({
            capabilities = capabilities,
        })
    end
end
