return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,

    config = function()

        require('lackluster').setup({

            tweak_background=
            {
                normal = 'none'
            }
        })
        vim.cmd.colorscheme('lackluster-hack')
    end
}
