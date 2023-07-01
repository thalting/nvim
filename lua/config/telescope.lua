require("telescope").setup({
    extensions = {
        undo = {
            mappings = {
                ["n"] = {
                    ["ya"] = require("telescope-undo.actions").yank_additions,
                    ["yd"] = require("telescope-undo.actions").yank_deletions,
                    ["<CR>"] = require("telescope-undo.actions").restore,
                },
                ["i"] = {
                    ["<CR>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
})
require("telescope").load_extension("undo")
require('telescope').load_extension('neoclip')
