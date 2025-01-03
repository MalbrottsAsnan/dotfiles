--[[

TODO: Document the different keychains, see Teams screenshot
TODO: nvim-dap/nvim-dap-ui???
TODO: Crossreference master, archive and origin once more
TODO: Keep an updated list of all keymaps in the top of the init file here
TODO: Review all keymap descriptions (lowercase vs uppercase for example)

NOTE: Inspiration with tmux https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5

Kickstart Guide:

  NOTE: The very first thing you should do is to run the command `:Tutor` in Neovim.

  Next, run and read ':help'. This should be the first place you go to look when you're
  stuck or confused with something. The keymap "<space>sh" is also provided to [s]earch 
  the [h]help documentation, which is very useful when you're not exactly sure of what
  you're looking for.

  NOTE: If you experience any errors while trying to install kickstart, run `:checkhealth`!

I hope you enjoy your Neovim journey,
- TJ

HACK: Stuff marked with this are custom configs and code in addition to the changeable presets!

--]]

-- HACK: Load vim.g, vim.opt, and other settings before anything else
require("options")

-- HACK: Load plugin independent keymaps
require("keymaps")

-- HACK: Load auto-commands
require("autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

require("lazy").setup({
    -- HACK: Import plugins from lua/plugins/...
    spec = {
        { import = "plugins" },
    },

    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
