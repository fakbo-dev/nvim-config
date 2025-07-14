return {
  {
    'X3eRo0/dired.nvim',
    cmd = { 'Dired' },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('dired').setup {
        path_separator = '/', -- Use '/' as the path separator (standard for Unix-like systems)
        show_banner = false, -- Hide the dired.nvim banner at the top
        show_icons = false, -- Set to true if you've installed nvim-web-devicons and a Nerd Font
        show_hidden = true, -- Show hidden files and directories (dotfiles)
        show_dot_dirs = true, -- Show '.' (current directory) and '..' (parent directory) entries
        show_colors = true, -- Enable color highlighting for different file types
        -- hide_details = false,     -- (Default: false) Show file details like permissions, size, date
        -- sort_order = "name",      -- (Default: "name") Other options: "size", "time"
        -- You can explore more options in the dired.nvim documentation:
        -- https://github.com/X3eRo0/dired.nvim#configuration
      }

      -- Set up keymaps specifically for dired.nvim buffers.
      -- These keymaps will only be active when you are in a 'dired' filetype buffer.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'dired',
        callback = function()
          local opts = { noremap = true, silent = true, buffer = true }

          -- Navigation and Basic Actions
          vim.keymap.set('n', '<CR>', ':DiredEnter<CR>', opts) -- Enter directory or open file
          vim.keymap.set('n', '-', ':DiredGoUp<CR>', opts) -- Go to parent directory
          vim.keymap.set('n', 'q', ':q<CR>', opts) -- Quit dired buffer

          -- File/Directory Management
          vim.keymap.set('n', 'R', ':DiredRename<CR>', opts) -- Rename file/directory
          vim.keymap.set('n', 'dd', ':DiredDelete<CR>', opts) -- Delete file/directory
          vim.keymap.set('v', 'D', ':DiredDeleteRange<CR>', opts) -- Delete visual selection
          vim.keymap.set('n', 'c', ':DiredCreateFile<CR>', opts) -- Create new file
          vim.keymap.set('n', 'C', ':DiredCreateDir<CR>', opts) -- Create new directory
          vim.keymap.set('n', 'yy', ':DiredCopy<CR>', opts) -- Copy file/directory
          vim.keymap.set('v', 'Y', ':DiredCopyRange<CR>', opts) -- Copy visual selection
          vim.keymap.set('n', 'mm', ':DiredMove<CR>', opts) -- Move (cut) file/directory
          vim.keymap.set('v', 'M', ':DiredMoveRange<CR>', opts) -- Move visual selection
          vim.keymap.set('n', 'p', ':DiredPaste<CR>', opts) -- Paste copied/moved items

          -- Marking (for multiple operations)
          vim.keymap.set('n', 'm', ':DiredMark<CR>', opts) -- Mark file/directory
          vim.keymap.set('v', 'M', ':DiredMarkRange<CR>', opts) -- Mark visual selection
          vim.keymap.set('n', 'MD', ':DiredDeleteMarked<CR>', opts) -- Delete marked files
          vim.keymap.set('n', 'MC', ':DiredCopyMarked<CR>', opts) -- Copy marked files
          vim.keymap.set('n', 'MM', ':DiredMoveMarked<CR>', opts) -- Move marked files

          -- Toggles and Refresh
          vim.keymap.set('n', '.', ':DiredToggleHidden<CR>', opts) -- Toggle hidden files visibility
          vim.keymap.set('n', ',', ':DiredToggleSortOrder<CR>', opts) -- Toggle sort order
          vim.keymap.set('n', '*', ':DiredToggleIcons<CR>', opts) -- Toggle icons (if enabled)
          vim.keymap.set('n', '#', ':DiredToggleColors<CR>', opts) -- Toggle colors
          vim.keymap.set('n', '<leader>r', ':DiredRefresh<CR>', opts) -- Refresh the dired buffer
        end,
      })
    end,
  },

  -- If you enabled 'show_icons = true' above, you must have nvim-web-devicons installed.
  -- LazyVim often includes this by default, but it's good to be explicit if it's not.
  -- {
  --   'nvim-tree/nvim-web-devicons',
  --   lazy = true, -- Usually lazy-loaded by other plugins that use it.
  --   -- config = function()
  --   --   require('nvim-web-devicons').setup({
  --   --     -- your devicons config here
  --   --   })
  --   -- end,
  -- },
}
