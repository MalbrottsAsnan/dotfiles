-- Highligt todo, notes, etc in comments
return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
}
-- TODO: I am happy with the default configuration, however I would like to investigate the usefulness of setting up jump keymaps and using :TodoQuickFix, :TodoLocList, :Trouble todo, and :TodoTelescope, eventually binding some of those as well
