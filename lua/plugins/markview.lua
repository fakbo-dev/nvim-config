return
{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function ()
        require('render-markdown').setup({
            code =
            {
                disable_background = true
            },
            heading =
            {
                -- width = 'block'
            }
        })


    end
}
