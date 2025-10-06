return {
    -- testing
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,

    config = function()

        require('lackluster').setup({
            tweak_background=
            {
                normal = 'none',
                telescope = 'none',
            },
            tweak_syntax =
            {
                string = '#925757',
                comment = "#708090"
            },
        })
        vim.cmd.colorscheme('lackluster-hack')
    end
}
