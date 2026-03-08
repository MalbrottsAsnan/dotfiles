-- Visualize scope with vertical lines
local indentscope = require('mini.indentscope')
indentscope.setup({
    draw = {
        animation = function() return 15 end,
    }
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
