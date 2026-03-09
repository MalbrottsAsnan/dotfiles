-- Session management
local sessions = require('mini.sessions')
sessions.setup({
    file = ""
})

vim.api.nvim_create_user_command("MinishGo", function()
    sessions.select("read", { force = false })
end, { desc = "Select session in popup" })

vim.api.nvim_create_user_command("MinishMake", function(args)
    local name = string.match(args["args"], "([^%s]+)")
    sessions.write(name, { force = false })
end, { desc = "Create session, overriding disabled", nargs = 1 })

vim.api.nvim_create_user_command("MinishPop", function()
    sessions.select("delete", { force = true })
end, { desc = "Delete session in popup" })

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
