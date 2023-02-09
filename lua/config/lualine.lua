local colors = {
    blue = "#7cafc2",
    black = "#0c0c0d",
    green = "#a1b56c",
    white = "#d8d8d8",
    purple = "#ba8baf",
    yellow = "#f7ca88",
}

local dumb = {
    normal = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
    },

    insert = { a = { fg = colors.yellow, bg = colors.black } },
    visual = { a = { fg = colors.purple, bg = colors.black } },
    replace = { a = { fg = colors.blue, bg = colors.black } },
    command = { a = { fg = colors.green, bg = colors.black } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

return {
    options = {
        section_separators = { "", "" },
        component_separators = { "|", "|" },
        theme = dumb,
    },
    sections = {
        lualine_b = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic", "nvim_lsp" },
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                    error = "DiagnosticError",
                    warn = "DiagnosticWarn",
                    info = "DiagnosticInfo",
                    hint = "DiagnosticHint",
                },
                symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_c = { "branch", "filename" },
    },
}
