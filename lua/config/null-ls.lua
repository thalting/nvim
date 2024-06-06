local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- formatters
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.stylua,

        -- code actions
        null_ls.builtins.code_actions.gitsigns,

        -- diagnostics
        null_ls.builtins.diagnostics.fish,

        -- hover
        null_ls.builtins.hover.dictionary,
    },
})
