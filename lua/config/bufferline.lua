return {
    highlights = {
        fill = {
            fg = "#0c0c0d",
            bg = "#0c0c0d",
        },
        background = {
            fg = "#909090",
            bg = "#0c0c0d",
        },
        separator = {
            fg = "#303030",
            bg = "#0c0c0d",
        },
    },
    options = {
        mode = "buffer",
        indicator = {
            style = "none",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        diagnostics = "nvim_lsp",
        separator_style = { "┃", "┃" },
        show_close_icon = false,
        custom_filter = function(buf_number)
            if not string.find(vim.fn.bufname(buf_number), "localhost:") then
                return true
            end
        end,
    },
}
