return {
    -- lsp and completions
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
        dependencies = {
            {
                "nvimtools/none-ls.nvim",
                config = function()
                    require("config.null-ls")
                end,
            },
            {
                "j-hui/fidget.nvim",
                config = true,
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- snippets
            "dcampos/nvim-snippy",

            -- sources
            "FelipeLema/cmp-async-path",
            "andersevenrud/cmp-tmux",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "dcampos/cmp-snippy",
            "hrsh7th/cmp-buffer",
            "mtoohey31/cmp-fish",
        },
        config = function()
            require("config.cmp")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle" },

        config = function()
            require("trouble").setup({
                fold_open = "",
                fold_closed = "",
                indent_lines = false,
                signs = {
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "X",
                },
            })
            vim.api.nvim_set_hl(0, "TroubleText", {})
            vim.api.nvim_set_hl(0, "TroubleIndent", {})
            vim.api.nvim_set_hl(0, "TroubleLocation", {})
            vim.api.nvim_set_hl(0, "TroubleFoldIcon", {})
        end,
    },

    -- visual
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
        build = function()
            vim.cmd.TSUpdate()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        tag = "nerd-v2-compat",
        lazy = true,
        opts = require("config.devicons"),
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            filetypes = {
                "*",
                "!lazy",
            },
            user_default_options = {
                names = false,
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = require("config.lualine"),
    },
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        opts = require("config.bufferline"),
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    border = "double",
                    -- 'editor' and 'win' will default to being centered
                    relative = "win",
                },
            })
        end,
    },
    {
        "RRethy/nvim-base16",
        config = function()
            require("config.colorscheme")
        end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            trouble = false,
            current_line_blame_opts = {
                delay = 100,
            },
            preview_config = {
                border = "double",
            },
        },
    },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("neogit").setup({
                kind = "auto",
                mappings = {
                    status = {
                        ["1"] = false,
                        ["2"] = false,
                        ["3"] = false,
                        ["4"] = false,

                        ["<space>1"] = "Depth1",
                        ["<space>2"] = "Depth2",
                        ["<space>3"] = "Depth3",
                        ["<space>4"] = "Depth4",
                    },
                },
                integrations = {
                    telescope = true,
                },
            })
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "NeogitPopup",
                callback = function()
                    vim.opt_local.list = false
                end,
            })
        end,
    },

    -- life quality
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "debugloop/telescope-undo.nvim",
            {
                "AckslD/nvim-neoclip.lua",
                config = function()
                    require("neoclip").setup({
                        default_register = "+",
                    })
                end,
            },
        },
        config = function()
            require("config.telescope")
        end,
    },
    { "mcauley-penney/tidy.nvim", event = "BufWritePre", config = true },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        opts = {
            shade_terminals = false,
            persist_mode = false,
            float_opts = {
                border = "double",
            },
        },
    },
    {
        "monaqa/dial.nvim",
        lazy = true,
        config = function()
            require("config.dial")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        opts = {
            provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
            end,
        },
    },
    {
        "kylechui/nvim-surround",
        keys = {
            -- normal
            { "ys", mode = { "n" } },
            { "ds", mode = { "n" } },
            { "cs", mode = { "n" } },

            --  visual
            { "S", mode = { "v" } },
        },
        config = true,
    },
    { "folke/which-key.nvim", lazy = true, config = true }, -- required in keybinds.lua
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.autopairs")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
    {
        "Olical/conjure",
        init = function()
            -- conjure
            vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"

            vim.g["conjure#client#guile#socket#pipename"] = ".guile-repl.socket"

            vim.api.nvim_create_autocmd("BufNewFile", {
                pattern = "conjure-log-*",
                callback = function()
                    vim.diagnostic.disable(0)
                end,
            })
        end,
        ft = {
            "clojure",
            "scheme",
            "fennel",
            "lisp",
        },
    },

    -- deps
    { "nvim-lua/plenary.nvim", lazy = true },
}
