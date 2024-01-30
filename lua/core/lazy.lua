local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local pkgs = require("core.pkgs")
require("lazy").setup(pkgs, {
    install = {
        missing = true,
    },
    ui = {
        icons = {
            loaded = "●",
            not_loaded = "○",
            cmd = "",
            config = "",
            event = "",
            ft = "",
            init = " ",
            keys = "襁",
            plugin = "",
            runtime = "",
            source = "",
            start = "",
            task = "✔",
            require = " ",
            import = " ",
            lazy = " ",
            list = {
                "●",
                "➜",
                "",
                "‒",
            },
        },
    },
})
