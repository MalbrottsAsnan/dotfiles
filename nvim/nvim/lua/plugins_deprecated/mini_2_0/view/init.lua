-- Utility Start
require('utility')

local require_path = getRelativePathFromDebug(debug.getinfo(1))
-- Utility End

require(require_path .. "mini-statusline")
require(require_path .. "mini-tabline")
require(require_path .. "mini-indentscope")
require(require_path .. "mini-map")
