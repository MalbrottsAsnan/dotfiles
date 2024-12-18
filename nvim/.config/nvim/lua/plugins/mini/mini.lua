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
        end,
    },
}
