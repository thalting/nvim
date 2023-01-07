vim.g.mapleader = ","
vim.g.maplocalleader = ","

local mappings = {
    -- my maps
    { "n", "ZW", ":w<cr>" },
    { "n", "<leader>s", ":%s/" },
    { "n", "<leader><space>", ":nohlsearch<cr>" },

    -- telescope
    { "n", "<leader>tt", ":Telescope<cr>" },
    { "n", "<leader>tf", ":Telescope find_files<cr>" },
    { "n", "<leader>tg", ":Telescope live_grep<cr>" },
    { "n", "<leader>tb", ":Telescope buffers<cr>" },
    { "n", "<leader>th", ":Telescope help_tags<cr>" },

    -- toggleterm
    { "t", "<C-z>", "<C-\\><C-N>" },
    { "n", "<C-t>", ":ToggleTerm size=20 direction=horizontal<cr>" },
    { "t", "<C-t>", "<C-\\><C-N> :ToggleTerm size=20 direction=horizontal<cr>" }, -- fix toggle in zsh vi mode

    { "n", "<S-t>", ":ToggleTerm direction=float<cr>" },
    { "t", "<S-t>", "<C-\\><C-N> :ToggleTerm direction=float<cr>" }, -- fix toggle in zsh vi mode

    -- nabla
    { "n", "<leader>p", ":lua require('nabla').popup()<cr>", },

    -- lsp
    { "n", "gD", ":lua vim.lsp.buf.declaration()<cr>" },
    { "n", "gd", ":lua vim.lsp.buf.definition()<cr>" },
    { "n", "gi", ":lua vim.lsp.buf.implementation()<cr>" },
    { "n", "<space>h", ":lua vim.lsp.buf.hover()<cr>" },
    { "n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<cr>" },
    { "n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<cr>" },
    { "n", "<space>wl", ":lua function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end<cr>" },
    { "n", "<space>D", ":lua vim.lsp.buf.type_definition()<cr>" },
    { "n", "<space>rn", ":lua vim.lsp.buf.rename()<cr>" },
    { "n", "<space>ca", ":lua vim.lsp.buf.code_action()<cr>" },
    { "n", "gr", ":lua vim.lsp.buf.references()<cr>" },
    { "n", "<space>f", ":lua vim.lsp.buf.format()<cr>" },

    -- neogit
    { "n", "<space>g", ":Neogit<cr>" },

    -- gitsigns
    { 'n', '<space>gsa', ':Gitsigns attach<cr>' },
    { 'n', '<space>gsd', ':Gitsigns detach<cr>' },
    { 'n', '<space>gsb', ':Gitsigns blame_line<cr>' },
    { 'n', '<space>gst', ':Gitsigns toggle_current_line_blame<cr>' },

    -- buffers
    { "n", "<leader>bd", ":bdelete<cr>"},
    { "n", "<leader>bn", ":bnext<cr>"},
    { "n", "<leader>bp", ":bprevious<cr>"},
}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

for _, maps in pairs(mappings) do
    map(unpack(maps))
end
