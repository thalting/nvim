vim.g.mapleader = ","
vim.g.maplocalleader = ","

local mappings = {
    -- my maps
    { "n", "ZW", ":w<cr>" },
    { "n", "<leader>s", ":%s/" },
    { "n", "<leader><space>", ":nohlsearch<cr>" },

    -- telescope
    { "n", "<leader>tt", ":Telescope<cr>", { desc = "Telescope" } },
    { "n", "<leader>tf", ":Telescope find_files<cr>", { desc = "Find files" } },
    { "n", "<leader>tg", ":Telescope live_grep<cr>", { desc = "Live grep" } },
    { "n", "<leader>tb", ":Telescope buffers<cr>", { desc = "Buffers" } },
    { "n", "<leader>th", ":Telescope help_tags<cr>", { desc = "Help tags" } },

    -- toggleterm
    { "t", "<C-z>", "<C-\\><C-N>" },
    { "n", "<C-t>", ":ToggleTerm size=20 direction=horizontal<cr>" },
    { "t", "<C-t>", "<C-\\><C-N> :ToggleTerm size=20 direction=horizontal<cr>" }, -- fix toggle in zsh vi mode

    { "n", "<S-t>", ":ToggleTerm direction=float<cr>" },
    { "t", "<S-t>", "<C-\\><C-N> :ToggleTerm direction=float<cr>" }, -- fix toggle in zsh vi mode

    -- nabla
    { "n", "<leader>p", function() require("nabla").popup() end, },

    -- lsp
    { "n", "gD", vim.lsp.buf.declaration, { desc = "Jumps to the declaration" } },
    { "n", "gd", vim.lsp.buf.definition, { desc = "Jumps to the definition" } },
    { "n", "gi", vim.lsp.buf.implementation, { desc = "Lists all the implementations" } },
    { "n", "<space>h", vim.lsp.buf.hover, { desc = "Displays hover information" } },
    { "n", "<space>D", vim.lsp.buf.type_definition, { desc = "Jumps to the definition of the type" } },
    { "n", "<space>rn", vim.lsp.buf.rename, { desc = "Renames all references" } },
    { "n", "gr", vim.lsp.buf.references, { desc = "Lists all the references" } },
    { "n", "<space>f", vim.lsp.buf.format, { desc = "Formats a buffer" } },

    -- inc rename
    { "n", "<leader>rn", ":IncRename ", { desc = "Incremental rename" } },

    -- neogit
    { "n", "<space>g", ":Neogit<cr>", { desc = "Open Neogit" } },

    -- gitsigns
    { "n", "<leader>gsa", ":Gitsigns attach<cr>", { desc = "Attach" } },
    { "n", "<leader>gsd", ":Gitsigns detach<cr>", { desc = "Detach" } },
    { "n", "<leader>gsb", ":Gitsigns blame_line<cr>", { desc = "Blame line" } },
    { "n", "<leader>gst", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" } },

    -- bufferline
    { "n", "<A-1>", ":BufferLineGoToBuffer 1<cr>" },
    { "n", "<A-2>", ":BufferLineGoToBuffer 2<cr>" },
    { "n", "<A-3>", ":BufferLineGoToBuffer 3<cr>" },
    { "n", "<A-4>", ":BufferLineGoToBuffer 4<cr>" },
    { "n", "<A-5>", ":BufferLineGoToBuffer 5<cr>" },
    { "n", "<A-6>", ":BufferLineGoToBuffer 6<cr>" },
    { "n", "<A-7>", ":BufferLineGoToBuffer 7<cr>" },
    { "n", "<A-8>", ":BufferLineGoToBuffer 8<cr>" },
    { "n", "<A-9>", ":BufferLineGoToBuffer 9<cr>" },
    { "n", "<A-c>", ":BufferLinePickClose<cr>" },

    -- buffers
    { "n", "<leader>bd", ":bdelete<cr>", { desc = "Delete buffer" } },
    { "n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" } },
    { "n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" } },
}

-- Which key registers
local wk = require("which-key")
wk.register({
    g = { name = "Gitsigns" },
    b = { name = "Buffers" },
    t = { name = "Telescope" },
}, { prefix = "<leader>" })

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

for _, maps in pairs(mappings) do
    map(unpack(maps))
end
