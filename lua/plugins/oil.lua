return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts =
  {
    columns =
    {
      'permissions',
      'size',
      'mtime',
    },
    keymaps =
    {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    -- NOTE: was <C-q> before change for comfort
    ["q"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
