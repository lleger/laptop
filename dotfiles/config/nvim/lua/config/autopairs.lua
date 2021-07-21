local pairs = require("nvim-autopairs")
local endwise = require("nvim-autopairs.ts-rule").endwise

pairs.setup()

pairs.add_rules({
  endwise("then$", "end", "lua", "if_statement"),
})
