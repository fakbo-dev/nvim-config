return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,

    config = function()

        require('lackluster').setup({

            tweak_background=
            {
                normal = 'none',
                telescope = 'none'
            },
            tweak_highlight = {
                ["@keyword"] = {
                    bold = true,
                    italic = false,
                },
                ["@function"] = {
                    link = "@keyword",
                },
            },
        })
        vim.cmd.colorscheme('lackluster-hack')
    end
}
