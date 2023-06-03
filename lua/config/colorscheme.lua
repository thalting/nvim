local colors = {
    base00 = "#0c0c0d",
    base01 = "#282828",
    base02 = "#383838",
    base03 = "#585858",
    base04 = "#b8b8b8",
    base05 = "#d8d8d8",
    base06 = "#e8e8e8",
    base07 = "#f8f8f8",
    base08 = "#ab4642",
    base09 = "#dc9656",
    base0A = "#f7ca88",
    base0B = "#a1b56c",
    base0C = "#86c1b9",
    base0D = "#7cafc2",
    base0E = "#ba8baf",
    base0F = "#a16946",
}

require("base16-colorscheme").setup(colors)

vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.base05, bg = colors.base00 })
vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.base00 })

vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#0a0a0b" })

vim.api.nvim_set_hl(0, "Error", {})

vim.api.nvim_set_hl(0, "TroubleText", {})
vim.api.nvim_set_hl(0, "TroubleFoldIcon", {})
