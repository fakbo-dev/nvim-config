return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    colors = {
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        -- Make sidebar and line numbers transparent
        SignColumn = { bg = 'NONE' },
        LineNr = { bg = 'NONE' },
        CursorLineNr = { bg = 'NONE', fg = theme.ui.special, bold = true },
        FoldColumn = { bg = 'NONE' },

        -- Optional: Make other UI elements transparent
        NormalFloat = { bg = 'NONE' },
        FloatBorder = { bg = 'NONE' },

        -- For file explorers (NvimTree, Neo-tree, etc.)
        NvimTreeNormal = { bg = 'NONE' },
        NeoTreeNormal = { bg = 'NONE' },
      }
    end,
    theme = 'dragon',
    background = {
      dark = 'dragon',
      light = 'dragon',
    },
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme 'kanagawa'
  end,
}
