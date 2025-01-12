-- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            -- set use_icons to true if you have a Nerd Font
require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })

-- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            require('mini.statusline').section_location = function()
                return "%2l:%-2v"
            end

-- HACK: Overwrite filename with percentage + current session + filename
            ---@diagnostic disable-next-line: duplicate-set-field
            require('mini.statusline').section_filename = function()
                local session = vim.fn.fnamemodify(vim.v.this_session, ":t")
                if session == "" then
                    session = "No Session"
                end

                local ends = vim.fn.line("$") - 1
                local starts = vim.fn.line(".") - 1
                local percentage = math.floor(starts * 100 / ends)

                -- HACK: Check for "nan" condition if buffer is empty
                if percentage ~= percentage then
                    percentage = 0
                end

                return "  " .. percentage .. "％" .. "  󰉉 " .. session .. "  " .. vim.fn.expand("%")
            end



