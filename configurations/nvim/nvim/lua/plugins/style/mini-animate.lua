-- Set up the mini.nvim module
local setup = function()
  require("mini.animate").setup({
    cursor = { enable = false }, -- found this annoying
    scroll = {
  	  -- Animate equally with at most 180 steps instead of default 60
	  subscroll = require("mini.animate").gen_subscroll.equal({ max_output_steps = 180 }),
    }  
  })
end

setup() -- Call the setup, for easy disabling

-- Return empty table to lazy.nvim
return {}
