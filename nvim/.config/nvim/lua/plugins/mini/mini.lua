return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            local statusline = require("mini.statusline")
            -- set use_icons to true if you have a Nerd Font
            statusline.setup({ use_icons = vim.g.have_nerd_font })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return "%2l:%-2v"
            end

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim

            -- HACK: Animated environment
            -- This is eye candy :)
            require("mini.animate").setup({
                cursor = { enable = false },
                scroll = {
                    -- Animate equally but with at most 180 steps instead of default 60
                    subscroll = require("mini.animate").gen_subscroll.equal({ max_output_steps = 180 }),
                },
            })

            -- HACK: Nice tabline
            require("mini.tabline").setup()

            -- HACK: Add move-functionality
            -- Alt (Meta) + hjkl
            -- Works with both lines in normal mode and selections in visual mode
            require("mini.move").setup()

            -- HACK: Add session functionality
            -- :mksession ~/session_name
            -- This creates a file in user home directory which can later be deleted
            -- Works with mini.starter!
            require("mini.sessions").setup({ file = "" })

            -- HACK: Session commands
            vim.api.nvim_create_user_command("MinishGo", function()
                local sessions = require("mini.sessions")
                sessions.select("read", { force = false })
            end, { desc = "Select session in popup" })

            vim.api.nvim_create_user_command("MinishMake", function(args)
                local sessions = require("mini.sessions")
                local name = string.match(args["args"], "([^%s]+)")
                sessions.write(name, { force = false })
            end, { desc = "Create session, overriding disabled", nargs = 1 })

            vim.api.nvim_create_user_command("MinishPop", function()
                local sessions = require("mini.sessions")
                sessions.select("delete", { force = true })
            end, { desc = "Delete session in popup" })

            -- HACK: Header for starter screen
            local function starterheader()
                local hour = tonumber(vim.fn.strftime("%H"))
                -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
                local part_id = math.floor((hour + 4) / 8) + 1
                local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
                local username = os.getenv("USER")
                local logo =
                    "                                                    \n ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ \n ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ \n ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ \n ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ \n ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ \n ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ \n                                                    \n"

                local greeting = ("Good %s, %s"):format(day_part, username)

                return logo .. greeting
            end

            -- HACK: Add starters screen, nvim with no arguments
            require("mini.starter").setup({
                header = starterheader(),
                items = {
                    -- Use this if you set up "mini.sessions"
                    require("mini.starter").sections.sessions(3, true),

                    require("mini.starter").sections.telescope(),

                    require("mini.starter").sections.recent_files(10, false),
                },
                content_hooks = {
                    require("mini.starter").gen_hook.adding_bullet(),

                    require("mini.starter").gen_hook.aligning("center", "center"),
                },
            })

            -- HACK: Display map of the current buffer
            require("mini.map").setup({
                symbols = {
                    encode = require("mini.map").gen_encode_symbols.dot("4x2"),
                },
                integrations = {
                    require("mini.map").gen_integration.builtin_search(),
                    require("mini.map").gen_integration.gitsigns(),
                    require("mini.map").gen_integration.diagnostic(),
                },
                window = {
                    show_integration_count = false,

                    winblend = 10,
                },
            })

            vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
            vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
            vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)

            -- HACK: Autocommand on file open
            vim.api.nvim_create_autocmd({ "BufAdd", "BufNewFile" }, {
                callback = function()
                    MiniMap.open()
                end,
            })

            -- HACK: Nice notifications
            require("mini.notify").setup({
                lsp_progress = {
                    enable = false,
                },
                window = {
                    winblend = 10,
                },
            })
        end,
    },
}
