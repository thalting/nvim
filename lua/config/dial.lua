local augend = require("dial.augend")
local dial = require("dial.config")

local defaults = {
    augend.integer.alias.decimal_int, -- decimal integer (including negative number)
    augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
    augend.integer.alias.binary, -- binary natural number
    augend.semver.alias.semver, -- semantic version

    augend.constant.new({
        elements = { "and", "or" },
        word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
        cyclic = true, -- "or" is incremented into "and".
    }),
    augend.constant.new({
        elements = { "True", "False" },
        word = true,
        cyclic = true,
    }),
    augend.constant.new({
        elements = { "==", "!=" },
        word = false,
        cyclic = true,
    }),
    augend.constant.new({
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
    }),
    augend.constant.new({
        elements = { "<=", ">=" },
        word = false,
        cyclic = true,
    }),
    augend.constant.new({
        elements = { "<", ">" },
        word = false,
        cyclic = true,
    }),
}

dial.augends:register_group({
    -- default augends used when no group name is specified
    default = defaults,
})

dial.augends:on_filetype({
    -- call defaults at lest
    lua = {
        augend.constant.new({
            elements = { "==", "~=" },
            word = false,
            cyclic = true,
        }),
        unpack(defaults),
    },
    haskell = {
        augend.constant.new({
            elements = { "==", "/=" },
            word = false,
            cyclic = true,
        }),
        unpack(defaults),
    },
    rust = {
        augend.constant.new({
            elements = { "let", "const" },
            word = true,
            cyclic = true,
        }),
        unpack(defaults),
    },
    zig = {
        augend.constant.new({
            elements = { "var", "const" },
            word = true,
            cyclic = true,
        }),
        unpack(defaults),
    },
    javascript = {
        augend.constant.new({
            elements = { "===", "!==" },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { "var", "let", "const" },
            word = true,
            cyclic = true,
        }),
        unpack(defaults),
    },
    typescript = {
        augend.constant.new({
            elements = { "===", "!==" },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { "var", "let", "const" },
            word = true,
            cyclic = true,
        }),
        unpack(defaults),
    },
})
