local opts = {
    -- tabs
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    -- numbers
    number = true,
    relativenumber = true,

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
}

vim.opt.fillchars = { eob = " " }

for k, v in pairs(opts) do
    vim.o[k] = v
end

-- conjure
vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
vim.g["conjure#client#guile#socket#pipename"] = ".guile-repl.socket"
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "conjure-log-*",
    command = "lua vim.diagnostic.disable(0)",
})

-- remove the "How-to disable mouse"
vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
vim.cmd.aunmenu("PopUp.-1-")

-- don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})
