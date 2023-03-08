require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
