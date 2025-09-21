return {
    'rareitems/printer.nvim',
    config = function()
        require('printer').setup({
            keymap = "gp",

            add_to_inside = function(text)
                return text
            end
          })
    end
}
