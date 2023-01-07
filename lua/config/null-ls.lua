require("null-ls").setup({
    sources = {
        -- formatters
        require("null-ls").builtins.formatting.yapf,
        require("null-ls").builtins.formatting.zprint,
        require("null-ls").builtins.formatting.stylua,

        -- code actions
        require("null-ls").builtins.code_actions.gitsigns,

        -- diagnostics
        require("null-ls").builtins.diagnostics.fish,
        require("null-ls").builtins.diagnostics.clj_kondo,
        require("null-ls").builtins.diagnostics.clang_check,

        -- hover
        require("null-ls").builtins.hover.dictionary,
    },
})
