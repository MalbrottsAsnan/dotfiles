-- Utility Start
require('utility')

local require_path = getRelativePathFromDebug(debug.getinfo(1))
-- Utility End

require(require_path .. "style")

-- SORT THESE IN CORRECT LOADING ORDER!!!

require(require_path .. "edit")
require(require_path .. "lsp")
require(require_path .. "treesitter")
require(require_path .. "utility")
require(require_path .. "view")
require(require_path .. "workflow")
require(require_path .. "format")
