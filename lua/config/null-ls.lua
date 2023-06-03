local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- formatters
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.zprint,
        null_ls.builtins.formatting.stylua,

        -- code actions
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.shellcheck,

        -- diagnostics
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.clj_kondo,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.clang_check,

        -- hover
        null_ls.builtins.hover.dictionary,
    },
})
