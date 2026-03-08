-- Exposes Neovim-tailored ':Git' command
local git = require('mini.git')
git.setup()

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
