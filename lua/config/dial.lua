local augend = require("dial.augend")

require("dial.config").augends:register_group({
    -- default augends used when no group name is specified
    default = {
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
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { "==", "!=" },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { "<=", "<=" },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { "<", ">" },
            word = false,
            cyclic = true,
        }),
    },
})
