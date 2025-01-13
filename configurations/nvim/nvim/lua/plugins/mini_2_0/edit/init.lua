-- Utility Start
require('utility')

local require_path = getRelativePathFromDebug(debug.getinfo(1))
-- Utility End

require(require_path .. "mini-pairs")
require(require_path .. "mini-move")
