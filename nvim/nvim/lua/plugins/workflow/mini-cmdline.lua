-- Command line tweaks (autocomplete, autocorrec, etc.)
local cmdline = require('mini.cmdline')
cmdline.setup()

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
