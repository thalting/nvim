return {
    -- lsp and completions
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
        ft = {
            -- see config.lsp.servers
            "javascript",
            "typescript",
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
            "c",
        },
        dependencies = {
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("config.null-ls")
                end,
            },
            { "j-hui/fidget.nvim", config = true },
        },
    },
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        opts = {
            fold_open = "",
            fold_closed = "",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- snippets
            "dcampos/nvim-snippy",

            -- sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "dcampos/cmp-snippy",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            require("config.cmp")
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        config = true,
        cmd = "IncRename",
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
        opts = {
            override = {
                scm = {
                    icon = "λ",
                    color = "#e37933",
                    cterm_color = "173",
                    name = "Scheme",
                },
                fnl = {
                    color = "#fff3d7",
                    icon = "◐",
                    cterm_color = "230",
                    name = "Fennel",
                },
                default_icon = {
                    icon = "",
                    color = "#6d8086",
                    cterm_color = "66",
                    name = "Default",
                },
            },
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
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
    { "stevearc/dressing.nvim", keys = { { "<space>ca", ":lua vim.lsp.buf.code_action()<cr>" } } },
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
            trouble = false, -- for lazy load trouble.nvim
            current_line_blame_opts = {
                delay = 10,
            },
            preview_config = {
                border = "double",
            },
        },
    },
    { "TimUntersberger/neogit", cmd = "Neogit", config = true },

    -- life quality
    { "nvim-telescope/telescope.nvim", cmd = "Telescope" },
    { "mcauley-penney/tidy.nvim", event = "BufWritePre", config = true },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        opts = { shade_terminals = false },
    },
    {
        "kylechui/nvim-surround",
        opts = {
            keymaps = {
                visual = "s",
            },
        },
    },
    { "numToStr/Comment.nvim", event = "VeryLazy", config = true },
    { "folke/which-key.nvim", lazy = true, config = true }, -- required in keybinds.lua
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local pairs = require("nvim-autopairs")
            pairs.setup({
                disale_in_macro = true,
                enable_check_bracket_line = false,
            })
            pairs.get_rule("'")[1].not_filetypes = {
                "clojure",
                "scheme",
                "fennel",
                "lisp",
            }
        end,
    },
    {
        "Olical/conjure",
        config = function()
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
    { "jbyuki/nabla.nvim", lazy = true },

    -- deps
    "nvim-lua/plenary.nvim",
}
