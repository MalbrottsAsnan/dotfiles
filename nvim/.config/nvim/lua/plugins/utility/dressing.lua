return {
    -- HACK: Neat plugin for changing the input UI, but since telescope for select is already enabled elsewhere it is disabled here.
    {
        "stevearc/dressing.nvim",
        opts = {
            input = {
                title_pos = "center",
                relative = "win",
            },
            select = {
                enabled = false,
            },
        },
    },
}
