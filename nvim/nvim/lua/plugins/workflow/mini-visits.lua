-- File system visit tracking
local visits = require('mini.visits')
visits.setup()

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
