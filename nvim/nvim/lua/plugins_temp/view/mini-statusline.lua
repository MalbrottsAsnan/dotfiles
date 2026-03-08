-- Set up the mini.nvim module
require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font }) -- Use icons if you have a Nerd Font

-- Set the "location" section to show PERCENTAGE LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
require('mini.statusline').section_location = function()
	local ends = vim.fn.line("$") - 1
	local starts = vim.fn.line(".") - 1
	local percentage = math.floor(starts * 100 / ends)

	-- Check for "nan" condition if buffer is empty
	if percentage ~= percentage then
	  percentage = 0
	end

	-- Didn't work with normal percent sign, had to use nerd icon
	return percentage .. "％" .. "%2l:%-2v"
end

-- Overwrite filename with CURRENT_SESSIOn + FILENAME
---@diagnostic disable-next-line: duplicate-set-field
require('mini.statusline').section_filename = function()
	local session = vim.fn.fnamemodify(vim.v.this_session, ":t")
	if session == "" then
	    session = "No Session"
	end

	return "   " .. session .. "    " .. vim.fn.expand("%")
end

-- Return empty table to lazy.nvim
return {}
