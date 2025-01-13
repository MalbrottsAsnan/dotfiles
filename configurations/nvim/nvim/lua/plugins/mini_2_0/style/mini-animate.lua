require("mini.animate").setup({
	cursor = { enable = false },
	scroll = {
		-- HACK: Animate equally but with at most 180 steps instead of default 60
		subscroll = require("mini.animate").gen_subscroll.equal({ max_output_steps = 180 }),
	},
})
