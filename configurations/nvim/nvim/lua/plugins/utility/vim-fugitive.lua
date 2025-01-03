return {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<Leader>G", function()
            local presentwindow

            -- HACK: Check if fugitive git status is open
            for i = 1, vim.fn.winnr("$") do
                if vim.fn.getwinvar(i, "&filetype") == "fugitive" then
                    presentwindow = i
                end
            end

            -- HACK: Toggle the git status
            if presentwindow then
                vim.cmd(presentwindow .. "wincmd c")
            else
                vim.cmd("Git")
                vim.cmd("resize 10")
            end
        end, {
            silent = true,
            desc = "[G]it Status",
        })
    end,
}
