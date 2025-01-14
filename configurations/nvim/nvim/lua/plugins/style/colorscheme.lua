-- Set up the main colorscheme
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup since it's the main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function() -- load the colorscheme here
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_foreground = "material"

	vim.g.gruvbox_material_disable_italic_comment = false

	vim.g.gruvbox_material_cursor = 'auto'
	vim.g.gruvbox_material_ui_contrast = 'low'
	vim.g.gruvbox_material_float_style = 'bright'

	vim.g.gruvbox_material_transparent_background = false
	vim.g.gruvbox_material_show_eob = false

	vim.g.gruvbox_material_enable_bold = true
	vim.g.gruvbox_material_enable_italic = true

	vim.cmd.colorscheme('gruvbox-material')
    end
  }
}
