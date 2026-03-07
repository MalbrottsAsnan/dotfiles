return {
    -- HACK: Adds context to se what scope you are working in!
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                max_lines = 5,
                separator = " ",
            })
        end,
    },
}
