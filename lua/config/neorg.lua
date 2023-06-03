return {
    load = {
        ["core.defaults"] = {},
        ["core.export"] = { config = { extensions = "all" } },
        ["core.export.markdown"] = { config = { extensions = "all" } },
        ["core.dirman"] = {
            config = {
                workspaces = { my_workspace = "~/documents/notes" },
                autochdir = true,
            },
        },
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
    },
}
