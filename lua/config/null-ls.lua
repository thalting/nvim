local nullls = require("null-ls")

nullls.setup({
    sources = {
        -- formatters
        nullls.builtins.formatting.yapf,
        nullls.builtins.formatting.zprint,
        nullls.builtins.formatting.stylua,

        -- code actions
        nullls.builtins.code_actions.gitsigns,

        -- diagnostics
        nullls.builtins.diagnostics.fish,
        nullls.builtins.diagnostics.clj_kondo,
        nullls.builtins.diagnostics.clang_check,

        -- hover
        nullls.builtins.hover.dictionary,
    },
})
