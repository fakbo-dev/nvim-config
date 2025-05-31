return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/Programming/**/*.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Programming/**/*.md',
  },
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Programming',
        path = vim.fn.expand '~/Documents/Programming',
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

    -- SAFE KEY MAPPINGS USING COMMANDS ONLY
    vim.keymap.set('n', '<leader>nn', function()
      local title = vim.fn.input 'Note title: '
      if title and title ~= '' then
        vim.cmd('ObsidianNew ' .. vim.fn.fnameescape(title))
      end
    end, { desc = 'New note' })

    vim.keymap.set('n', '<leader>nf', function()
      vim.cmd 'ObsidianSearch'
    end, { desc = 'Search notes' })

    vim.keymap.set('n', '<leader>nt', function()
      vim.cmd 'ObsidianTemplate'
    end, { desc = 'Insert template' })

    vim.keymap.set('n', '<leader>nl', function()
      vim.cmd 'ObsidianFollowLink'
    end, { desc = 'Follow link' })

    vim.keymap.set('n', '<leader>nb', function()
      vim.cmd 'ObsidianBacklinks'
    end, { desc = 'Show backlinks' })

    vim.keymap.set('n', '<leader>ns', function()
      vim.cmd 'ObsidianQuickSwitch'
    end, { desc = 'Quick switch' })

    vim.keymap.set('n', '<leader>no', function()
      vim.cmd 'ObsidianOpen'
    end, { desc = 'Open in Obsidian' })

    vim.keymap.set('n', '<leader>nd', function()
      vim.cmd 'ObsidianToday'
    end, { desc = "Today's note" })

    vim.keymap.set('n', '<leader>nw', function()
      vim.cmd 'ObsidianWorkspace'
    end, { desc = 'Switch workspace' })

    -- Toggle checkbox
    vim.keymap.set('n', '<leader>tt', function()
      vim.cmd 'ObsidianToggleCheckbox'
    end, { desc = 'Toggle checkbox' })

    -- Content creation helpers
    vim.keymap.set('n', '<leader>nc', function()
      local ft = vim.bo.filetype
      vim.api.nvim_put({ '```' .. ft, '', '```' }, 'c', true, true)
      vim.cmd 'normal! kO'
    end, { desc = 'Insert code block' })

    vim.keymap.set('n', '<leader>nm', function()
      vim.api.nvim_put({ '```mermaid', 'graph TD', '    A --> B', '```' }, 'c', true, true)
    end, { desc = 'Insert mermaid diagram' })

    vim.keymap.set('n', '<leader>nlg', function()
      vim.cmd('ObsidianTemplate ' .. vim.fn.expand '~/Documents/Programming/Templates/learning.template.md')
    end, { desc = 'Insert learning template' })

    vim.keymap.set('n', '<leader>nsg', function()
      vim.cmd('ObsidianTemplate ' .. vim.fn.expand '~/Documents/Programming/Templates/snippet.template.md')
    end, { desc = 'Insert snippet template' })

    -- Insert resource link
    vim.keymap.set('n', '<leader>nlr', function()
      local resource_label = 'Resource ' .. os.date '%Y-%m'
      vim.cmd('normal! a[[' .. resource_label .. ']]')
    end, { desc = 'Insert resource link' })

    -- Search snippets
    vim.keymap.set('n', '<leader>nfs', function()
      vim.cmd 'ObsidianSearch #snippet'
    end, { desc = 'Search snippets' })

    -- Set default workspace on startup
    vim.defer_fn(function()
      vim.cmd 'ObsidianWorkspace Programming'
    end, 1000)
  end,
}
