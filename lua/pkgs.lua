local pkgs = {
    "savq/paq-nvim",

    -- lsp and completions
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "PaterJason/cmp-conjure",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",

    -- visual
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            vim.cmd("TSUpdate")
        end,
    },
    "kyazdani42/nvim-web-devicons",
    "NvChad/nvim-colorizer.lua",
    "nvim-lualine/lualine.nvim",
    "RRethy/nvim-base16",

    -- git
    "lewis6991/gitsigns.nvim",
    "TimUntersberger/neogit",

    -- life quality
    "nvim-telescope/telescope.nvim",
    "mcauley-penney/tidy.nvim",
    "akinsho/toggleterm.nvim",
    "kylechui/nvim-surround",
    "numToStr/Comment.nvim",
    "windwp/nvim-autopairs",
    "folke/which-key.nvim",
    "aserowy/tmux.nvim",
    "lmburns/lf.nvim",
    "Olical/conjure",

    -- other
    "lewis6991/impatient.nvim",
    "nvim-lua/plenary.nvim",
}

return pkgs
