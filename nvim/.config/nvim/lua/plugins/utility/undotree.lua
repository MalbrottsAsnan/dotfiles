return {
    {
        -- HACK: Very nice feature
        "mbbill/undotree",
        lazy = false,
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<C-\\>",
                ":UndotreeToggle<CR>",
                { silent = true, desc = "Toggle mbbill/undotree" }
            )

            local directory = vim.fn.stdpath("data") .. "/undodir"

            if vim.fn.isdirectory(directory) ~= 1 then
                pcall(vim.fn.mkdir, directory, "p")
            end

            vim.opt.undodir = directory
            -- vim.opt.undofile is set elsewhere
        end,
    },
}
