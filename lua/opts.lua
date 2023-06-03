local opts = {
    -- tabs
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    -- numbers
    number = true,
    relativenumber = true,

    -- folding
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,

    -- misc
    list = true,
    wrap = false,
    confirm = true,
    swapfile = false,
    shortmess = "I",
    cursorline = true,
    inccommand = "split",
    clipboard = "unnamedplus",
    termguicolors = true,
    fillchars = { eob = " " },
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end

vim.loader.enable()

-- remove the "How-to disable mouse"
vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
vim.cmd.aunmenu("PopUp.-1-")
