-- Show one or more highlighted notifications in a single floating window
local notify = require('mini.notify')
-- Modify window placement depending on MiniMap display status
local window_config = function()
    local pad = 0
    if next(MiniMap.current.opts) then
        pad = MiniMap.current.opts.window.width
    end
    return {
        anchor = 'NE',
        col = vim.opt.columns._value - pad,
        row = 1
    }
end
notify.setup({
    window = {
        config = window_config
    }
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
