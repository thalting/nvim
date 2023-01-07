return {
    -- lsp and completions
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.null-ls")
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = function()
            require("trouble").setup({
                fold_open = "",
                fold_closed = "",
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
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
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    scm = {
                        icon = "λ",
                        color = "#e37933",
                        cterm_color = "173",
                        name = "Scheme",
                    },
                    default_icon = {
                        icon = "",
                        color = "#6d8086",
                        cterm_color = "66",
                        name = "Default",
                    },
                },
            })
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    names = false,
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        config = function()
            require("config.bufferline")
        end
    },
    "stevearc/dressing.nvim",
    {
        "RRethy/nvim-base16",
        config = function()
            require("config.colorscheme")
        end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                trouble = false,
                current_line_blame_opts = {
                    delay = 10,
                },
            })
        end,
    },
    { "TimUntersberger/neogit", cmd = "Neogit", config = true },

    -- life quality
    { "nvim-telescope/telescope.nvim", cmd = "Telescope" },
    { "asiryk/auto-hlsearch.nvim", config = true },
    { "mcauley-penney/tidy.nvim", event = "BufWritePre", config = true },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm").setup({
                shade_terminals = false,
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    visual = "s",
                },
            })
        end,
    },
    { "numToStr/Comment.nvim", config = true },
    {
        "windwp/nvim-autopairs",
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
    { "folke/which-key.nvim", config = true },
    {
        "Olical/conjure",
        ft = {
            "clojure",
            "scheme",
            "fennel",
            "lisp",
        },
    },

    -- other
    "nvim-lua/plenary.nvim",

    -- documents
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = function()
            require("config.neorg")
        end,
        build = function()
            vim.cmd.Neorg("sync-parsers")
        end,
    },
    { "jbyuki/nabla.nvim", lazy = true },
}
