-- Fast and flexible start screen
local starter = require('mini.starter')
local header = function()
    -- Night [00:00-06:00], Morning [06:00-12:00], Afternoon [12:00-18:00], Evening [18:00-24:00]
    local hour = tonumber(vim.fn.strftime('%H'))
    local day_part_id = math.floor(hour / 6) + 1
    local day_part_string = ({ "evening", "morning", "afternoon", "evening" })[day_part_id]
    local username = os.getenv("USER")
    local logo = "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\n\n"
    local greeting = ("Good %s, %s "):format(day_part_string, username)
    return logo .. greeting        
end
starter.setup({
    header = header,
    items = {
        starter.sections.sessions(3, true),
        starter.sections.pick(),
        starter.sections.recent_files(5, false, true),
        starter.sections.builtin_actions(),
    },
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
