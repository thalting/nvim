local rule = require("nvim-autopairs.rule")
local pairs = require("nvim-autopairs")

pairs.setup({
    disable_in_macro = true,
    enable_check_bracket_line = false,
})

pairs.add_rules({
    rule("'", "", {
        "clojure",
        "scheme",
        "fennel",
        "lisp",
    }),
})
