require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.export"] = { config = { extensions = "all" } },
        ["core.export.markdown"] = { config = { extensions = "all" } },
        ["core.norg.dirman"] = {
            config = {
                workspaces = { my_workspace = "~/documents/notes" },
                autochdir = true,
            },
        },
        ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
    },
})
