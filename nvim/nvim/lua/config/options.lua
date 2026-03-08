--[[

    Editor Display Options

--]]

-- Show relative line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the signcolumn
vim.opt.signcolumn = "yes"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Cursor always stays fat
vim.opt.guicursor = "a:block"

-- Don't show the current mode, since that's already displayed in the status line
vim.opt.showmode = false

-- Nice 24-bit colors if the terminal emulator supports it!
vim.opt.termguicolors = true

--[[

    Text Display Options

--]]

-- Continue indentation of wrapped lines
vim.opt.breakindent = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

--[[

    Search and Subsitutions

--]]

-- Case-insensitive searching unless C\ is used or the search term contains one or more capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions live, as you type! Also shows partial off-screen results in a preview window
vim.opt.inccommand = "split"

--[[

    Editor Behaviour

--]]

-- If performing an operation that would fail due to unsaved changes in the buffer (like ':q'),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Save undo history
vim.opt.undofile = true

-- Decrease the update time
vim.opt.updatetime = 250

-- Decrease the mapped sequence wait time
vim.opt.timeoutlen = 300

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
