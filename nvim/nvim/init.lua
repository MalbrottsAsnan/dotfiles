--[[

TODO: Document the different keychains, see Teams screenshot
TODO: nvim-dap/nvim-dap-ui???
TODO: Crossreference master, archive and origin once more
TODO: Keep an updated list of all keymaps in the top of the init file here
TODO: Review all keymap descriptions (lowercase vs uppercase for example)

NOTE: Inspiration with tmux https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5

CLIPBOARD
CLIPBOARD
CLIPBOARD

--]]

-- TODO: mini.indentscope: Check if mappings are colliding and if they should be added to mini.clue
-- TODO: mini.map: Check mappings and autocmd


--[[

    General Configuration

--]]

require("config.globals")
require("config.options")
-- require("config.keymaps") -- Plugin-specific keymaps are managed together with the plugin configuration!
-- require("config.autocmds")

--[[

    Plugin Configuration

--]]

-- Install and configure plugins using lazy.nvim
-- Use the ':Lazy' command to manage them!
require("config.lazy")
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})