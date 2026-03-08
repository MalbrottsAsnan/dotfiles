-- Define own statusline structure
local statusline = require('mini.statusline')
statusline.setup({
    use_icons = vim.g.have_nerd_font
})
-- Set the "location" section to show PERCENTAGE LINE:COLUMN
statusline.section_location = function()
    local ends = vim.fn.line('$') - 1
    local starts = vim.fn.line('.') - 1
    local percentage = math.floor(starts * 100 / ends)

    -- Check for "nan" condition if buffer is empty
    if percentage ~= percentage then
        percentage = 0
    end

    -- Didn't work with normal percent sign, had to use nerd icon
    return percentage .. "％" .. "%2l:%-2v"
end
-- Overwrite filename with CURRENT_SESSION + FILENAME
statusline.section_filename = function()
	local session = vim.fn.fnamemodify(vim.v.this_session, ":t")
	if session == "" then
	    session = "No Session"
	end

	return "   " .. session .. "    " .. vim.fn.expand("%")
end

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
