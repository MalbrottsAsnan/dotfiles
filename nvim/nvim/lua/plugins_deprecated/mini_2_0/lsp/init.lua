-- Utility Start
require('utility')

local require_path = getRelativePathFromDebug(debug.getinfo(1))
-- Utility End

require(require_path .. "lazydev")
require(require_path .. "luvit-meta")
require(require_path .. "nvim-lspconfig")
