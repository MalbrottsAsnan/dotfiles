-- Highligt todo, notes, etc in comments
return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
	signs = vim.g.have_nerd_font, -- Use signs if you have a Nerd Font
    }
  }
}
-- TODO: I am happy with the default configuration, however I would like to investigate the usefulness of setting up jump keymaps and using :TodoQuickFix, :TodoLocList, :Trouble todo, and :TodoTelescope, eventually binding some of those as well
