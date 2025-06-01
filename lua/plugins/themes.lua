return {
  {
    'vague2k/vague.nvim',
    config = function()
      require('vague').setup {
        transparent = true,
        style = {
          -- [Keep existing style settings] --
        },
        colors = {
          func = '#ffffff', -- Pure white for functions
          keyword = '#9a86a8', -- Dusty purple
          string = '#a8b38d', -- Olive green
          number = '#d4bd98', -- Warm sand
          type = '#7f9fbf', -- SOFT DESATURATED BLUE (was lavender)
          variable = '#a0a0a0', -- SOFTER GRAY for variables/parameters
          constant = '#e0e0e0', -- Brighter gray for constants
        },
      }
      vim.cmd.colorscheme 'vague'

      -- Base styling
      vim.api.nvim_set_hl(0, 'Normal', { fg = '#e0e0e0', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'Comment', { fg = '#808080', italic = false })

      -- JavaScript specific enhancements
      vim.api.nvim_set_hl(0, '@function', { fg = '#ffffff' }) -- Force white for functions
      vim.api.nvim_set_hl(0, '@method', { fg = '#ffffff' }) -- Methods as white
      vim.api.nvim_set_hl(0, '@parameter', { fg = '#a0a0a0' }) -- Parameters as soft gray
      vim.api.nvim_set_hl(0, '@variable', { fg = '#a0a0a0' }) -- Variables as soft gray

      -- Type highlighting
      vim.api.nvim_set_hl(0, '@type', { fg = '#7f9fbf' }) -- Soft blue for types
      vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#7f9fbf' }) -- Built-in types

      -- UI refinements
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#606060', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#9a86a8', bg = 'NONE', bold = true })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#121212', fg = '#d0d0d0' })
      vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#1a1a2a', fg = '#9a86a8' })

      -- Special JavaScript elements
      vim.api.nvim_set_hl(0, '@function.call', { fg = '#ffffff' }) -- Function calls
      vim.api.nvim_set_hl(0, '@constructor', { fg = '#7f9fbf' }) -- Constructors (like types)
      vim.api.nvim_set_hl(0, '@property', { fg = '#c0c0c0' }) -- Object properties
      vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#e0e0e0' }) -- Built-in variables

      -- Status line (using blue accent)
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#0a0a0a', fg = '#7f9fbf' }) -- Soft blue
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#0a0a0a', fg = '#606060' })
    end,
  },

  -- Essential dependencies
  { 'rktjmp/lush.nvim' },
  { 'tjdevries/colorbuddy.nvim' },

  -- Add nvim-treesitter for enhanced JavaScript highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'javascript' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
}
