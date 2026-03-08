-- Highligt text with configurable patterns and highlight groups
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        fixme= { pattern = '%f[%w]()FIXME:()%f[%P]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK:()%f[%P]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO:()%f[%P]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE:()%f[%P]', group = 'MiniHipatternsNote' },
    },

    hex_color = hipatterns.gen_highlighter.hex_color(),
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
