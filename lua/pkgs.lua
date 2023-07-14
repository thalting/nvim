return {
    -- lsp and completions
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
        ft = {
            -- see config.lsp.servers
            "typescriptreact",
            "typescript",
            "javascript",
            "haskell",
            "clojure",
            "elixir",
            "python",
            "ocaml",
            "rust",
            "lua",
            "cpp",
            "zig",
            "go",
            "sh",
            "c",
        },
        dependencies = {
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("config.null-ls")
                end,
            },
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                opts = {
                    text = {
                        spinner = "dots", -- animation shown when tasks are ongoing
                    },
                },
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
                    other = "﫠",
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
        config = true,
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
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({
                input_buffer_type = "dressing",
            })
        end,
    },
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
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gc", mode = { "n", "v" } },
            { "gb", mode = { "n", "v" } },
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
        filetype = {
            "typescriptreact",
            "typescript",
            "javascript",
            "markdown",
            "html",
            "jsx",
            "tsx",
            "vue",
            "xml",
        },
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

    -- documents
    {
        "nvim-neorg/neorg",
        ft = "norg",
        opts = require("config.neorg"),
        build = function()
            vim.cmd.Neorg("sync-parsers")
        end,
    },

    -- deps
    { "nvim-lua/plenary.nvim", lazy = true },
}
