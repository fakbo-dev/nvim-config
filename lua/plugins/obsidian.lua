return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/Second_Brain/**/*.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Second_Brain/**/*.md',
  },
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Second_Brain',
        path = vim.fn.expand '~/Documents/Second_Brain',
      },
      {
        name = 'work_proyects',
        path = vim.fn.expand '~/Documents/work_proyects',
      },
    },
    disable_frontmatter = true,
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        return tostring(os.time())
      end
    end,
    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M:%S',
      aliases = {
        programming = 'prog.template.md',
        learning = 'learning.template.md',
        snippet = 'snippet.template.md',
      },
    },
    ui = {
      checkboxes = {
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
        ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
        ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
      },
      bullets = { char = '•', hl_group = 'ObsidianBullet' },
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    vim.keymap.set('n', '<leader>nf', function()
      vim.cmd 'ObsidianSearch'
    end, { desc = 'obsidian: Search notes by grep' })

    vim.keymap.set('n', '<leader>nta', function()
      vim.cmd 'ObsidianTags'
    end, { desc = 'obsidian: Browse all tags' })

    vim.keymap.set('n', '<leader>nt', function()
      vim.cmd 'ObsidianTemplate'
    end, { desc = 'obsidian: Insert template' })

    vim.keymap.set('n', '<leader>nl', function()
      vim.cmd 'ObsidianFollowLink'
    end, { desc = 'obsidian: Follow link' })

    vim.keymap.set('n', '<leader>nb', function()
      vim.cmd 'ObsidianBacklinks'
    end, { desc = 'obsidian: Show backlinks' })

    vim.keymap.set('n', '<leader>ns', function()
      vim.cmd 'ObsidianQuickSwitch'
    end, { desc = 'obsidian: Search notes' })

    vim.keymap.set('n', '<leader>no', function()
      vim.cmd 'ObsidianOpen'
    end, { desc = 'obsidian: Open in Obsidian' })

    vim.keymap.set('n', '<leader>nc', function()
      local ft = vim.bo.filetype
      vim.api.nvim_put({ '```' .. ft, '', '```' }, 'c', true, true)
      vim.cmd 'normal! kO'
    end, { desc = 'obsidian: Insert code block' })

    vim.defer_fn(function()
      vim.cmd 'ObsidianWorkspace Second_Brain'
    end, 1000)
  end,
}
