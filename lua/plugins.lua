require("impatient")

local pkgs = require("pkgs")
require("paq")({ unpack(pkgs) })

require("tidy").setup()
require("neogit").setup()
require("toggleterm").setup()
require("Comment").setup()
require("which-key").setup()

require("tmux").setup({
    copy_sync = {},
    navigation = {
        enable_default_keybindings = false,
    },
    resize = {
        enable_default_keybindings = false,
    },
})

require("nvim-surround").setup({
    keymaps = {
        visual = "s",
    },
})

require("gitsigns").setup({
    current_line_blame_opts = {
        delay = 10,
    },
})

require("colorizer").setup({
    user_default_options = {
        names = false,
    },
})

require("nvim-autopairs").setup({
    disale_in_macro = true,
    enable_check_bracket_line = false,
})

require("nvim-autopairs").get_rule("'")[1].not_filetypes = {
    "clojure",
    "scheme",
    "fennel",
    "lisp",
}

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "go",
        "vim",
        "cpp",
        "zig",
        "lua",
        "nix",
        "rust",
        "llvm",
        "glsl",
        "bash",
        "make",
        "vala",
        "ocaml",
        "meson",
        "python",
        "fennel",
        "elixir",
        "sxhkdrc",
        "haskell",
        "clojure",
        "markdown",
        "gitignore",
        "commonlisp",
        "javascript",
        "typescript",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
