return {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
        vim.api.nvim_set_keymap(
            "n",
            "<Leader>G",
            ":Git<CR><C-w>7-",
            { noremap = true, silent = true, desc = "[G]it status" }
        )
    end,
}
