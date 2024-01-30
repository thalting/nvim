vim.g.mapleader = ","
vim.g.maplocalleader = ","

local mappings = {
    -- my maps
    { "n", "ZW", ":w<cr>" },
    { "n", "<C-s>", ":w<cr>" },
    { "n", "<leader>s", ":%s/" },
    { "v", "<leader>s", ":s/" },
    { "n", "<leader><space>", ":nohlsearch<cr>" },
    { "n", "<C-z>", "<nop>" }, -- disable suspend

    -- move lines
    { "n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" } },
    { "n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" } },
    { "i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" } },
    { "i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" } },
    { "v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" } },
    { "v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" } },

    -- move to window using the <ctrl> hjkl keys
    { "n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true } },
    { "n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true } },
    { "n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true } },
    { "n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true } },

    -- resize window using <ctrl> arrow keys
    { "n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" } },
    { "n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" } },
    { "n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" } },
    { "n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" } },

    -- telescope
    { "n", "<leader>tt", ":Telescope<cr>", { desc = "Telescope" } },
    { "n", "<leader>tf", ":Telescope find_files<cr>", { desc = "Find files" } },
    { "n", "<leader>tg", ":Telescope live_grep<cr>", { desc = "Live grep" } },
    { "n", "<leader>tb", ":Telescope buffers<cr>", { desc = "Buffers" } },
    { "n", "<leader>th", ":Telescope help_tags<cr>", { desc = "Help tags" } },
    { "n", "<leader>tu", ":Telescope undo<cr>", { desc = "Undo tree" } },
    { "n", "<leader>tc", ":Telescope neoclip<cr>", { desc = "Open neoclip" } },

    -- toggleterm
    { "t", "<esc><esc>", "<C-\\><C-N>", { desc = "Enter Normal Mode" } },
    { "n", "<C-t>", ":ToggleTerm size=20 direction=horizontal<cr>" },
    { "t", "<C-t>", "<C-\\><C-N> :ToggleTerm<cr>" }, -- fix toggle in zsh vi mode

    { "n", "<S-t>", ":ToggleTerm direction=float<cr>" },

    -- lsp
    { "n", "gD", vim.lsp.buf.declaration, { desc = "Jumps to the declaration" } },
    { "n", "gd", vim.lsp.buf.definition, { desc = "Jumps to the definition" } },
    { "n", "gi", vim.lsp.buf.implementation, { desc = "Lists all the implementations" } },
    { "n", "<space>h", vim.lsp.buf.hover, { desc = "Displays hover information" } },
    { "n", "<space>D", vim.lsp.buf.type_definition, { desc = "Jumps to the definition of the type" } },
    { "n", "<space>rn", vim.lsp.buf.rename, { desc = "Renames all references" } },
    { "n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code actions" } },
    { "n", "gr", vim.lsp.buf.references, { desc = "Lists all the references" } },
    { "n", "<space>f", vim.lsp.buf.format, { desc = "Formats a buffer" } },
    { "n", "<space>e", vim.diagnostic.open_float, { desc = "Show diagnostics in a floating window" } },
    { "n", "[d", vim.diagnostic.goto_prev, { desc = "Move to the previous diagnostic" } },
    { "n", "]d", vim.diagnostic.goto_next, { desc = "Move to the next diagnostic" } },
    { "n", "<space>q", vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to the location list" } },

    -- neogit
    { "n", "<space>g", ":Neogit<cr>", { desc = "Open Neogit" } },

    -- trouble
    { "n", "<space>t", ":TroubleToggle<cr>", { desc = "Open Trouble" } },

    -- lazy
    { "n", "<leader>ll", ":Lazy<cr>", { desc = "Lazy home" } },
    { "n", "<leader>ls", ":Lazy sync<cr>", { desc = "Lazy sync" } },
    { "n", "<leader>lc", ":Lazy clear<cr>", { desc = "Lazy clear" } },
    { "n", "<leader>lu", ":Lazy update<cr>", { desc = "Lazy update" } },
    { "n", "<leader>lp", ":Lazy profile<cr>", { desc = "Lazy profile" } },
    { "n", "<leader>li", ":Lazy install<cr>", { desc = "Lazy install" } },

    -- gitsigns
    { "n", "<leader>gsa", ":Gitsigns attach<cr>", { desc = "Attach" } },
    { "n", "<leader>gsd", ":Gitsigns detach<cr>", { desc = "Detach" } },
    { "n", "<leader>gsb", ":Gitsigns blame_line<cr>", { desc = "Blame line" } },
    { "n", "<leader>gst", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" } },

    -- dial
    { "n", "<C-a>", function() return require("dial.map").inc_normal() end, { expr = true }, },
    { "n", "<C-x>", function() return require("dial.map").dec_normal() end, { expr = true }, },
    { "v", "<C-a>", function() return require("dial.map").inc_visual() end, { expr = true }, },
    { "v", "<C-x>", function() return require("dial.map").dec_visual() end, { expr = true }, },

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
    { "n", "<A-x>", ":BufferLinePickClose<cr>" },
    { "n", "<A-c>", ":bdelete<cr>" },
    { "n", "<A-,>", ":BufferLineCyclePrev<cr>" },
    { "n", "<A-.>", ":BufferLineCycleNext<cr>" },
    { "n", "<A-<>", ":BufferLineMovePrev<cr>" },
    { "n", "<A->>", ":BufferLineMoveNext<cr>" },

    -- buffers
    { "n", "<leader>bd", ":bdelete<cr>", { desc = "Delete buffer" } },
    { "n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" } },
    { "n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" } },
}

-- Which key registers
local wk = require("which-key")
wk.register({
    ["l"] = { name = "Lazy" },
    ["b"] = { name = "Buffers" },
    ["g"] = { name = "Gitsigns" },
    ["t"] = { name = "Telescope" },
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
