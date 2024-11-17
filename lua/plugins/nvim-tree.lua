return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"
    
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
    
      -- default mappings
      -- api.config.mappings.default_on_attach(bufnr)
    
      -- custom mappings
      -- vim.keymap.set('n', '<C-S-t>', api.tree.change_root_to_parent,        opts('Up'))
      vim.keymap.set('n', '?',api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    end
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    
    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    
    -- OR setup with some options
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      on_attach = my_on_attach,
    })
  end,
}
