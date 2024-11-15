-- Autocompletion
return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
        },

        snippet = {
          expand = function(args)
            -- vim.snippet.expand(args.body)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          -- ['<Tab>'] = cmp.mapping.select_next_item({select = false}),
          -- ['<S-Tab>'] = cmp.mapping.select_prev_item({select = false}),




          -- Super tab
         ['<Tab>'] = cmp.mapping(function(fallback)
           local luasnip = require('luasnip')
           local col = vim.fn.col('.') - 1

           if cmp.visible() then
             cmp.select_next_item({behavior = 'select'})
           elseif luasnip.expand_or_locally_jumpable() then
             luasnip.expand_or_jump()
           elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
             fallback()
           else
             cmp.complete()
           end
         end, {'i', 's'}),

         -- Super shift tab
         ['<S-Tab>'] = cmp.mapping(function(fallback)
           local luasnip = require('luasnip')

           if cmp.visible() then
             cmp.select_prev_item({behavior = 'select'})
           elseif luasnip.locally_jumpable(-1) then
             luasnip.jump(-1)
           else
             fallback()
           end
         end, {'i', 's'}),

        }),

        formatting = {
          fields = {'abbr', 'kind', 'menu'},
          format = require('lspkind').cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
          })
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

      })
    end
  }

