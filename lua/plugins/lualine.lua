return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "rebelot/kanagawa.nvim"
    },
    opts = function ()
        return require("minim")
        -- Or alternatively, different path to where you saved the 'minim' file, for example:
        -- return require("plugins.lualine.minim")
    end
}
