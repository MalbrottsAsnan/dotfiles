-- Utility

-- Get the path relative to "nvim/lua/" using the lua file's debug info
function getRelativePathFromDebug(debug_info)
	local last_match
	local search_pattern = "nvim/lua/"
	local file_path = debug_info.source:match("@?(.*/)")

	-- Start from the beginning of the file_path and iteratively find matches
	for match_start, match_end in file_path:gmatch("()" .. search_pattern .. "()(.*)") do
		last_match = file_path:sub(match_end) -- Capture everything after the last match
	end

	-- Return the last match or an empty string if no matches are found
	return last_match or ""
end
