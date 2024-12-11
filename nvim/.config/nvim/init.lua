--[[

TODO: Add nvim-ufo with lsp and or treesitter
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

-- Load vim.g, vim.opt, and other settings before anything else
require('globals')

-- Load almost all keymaps
require('keymaps')

