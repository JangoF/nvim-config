vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

-- function Dump(object)
--   local result = '{ '
--
--   if type(object) == 'table' then
--
--     for key, value in pairs(object) do
--
--       -- if type(key) ~= 'number' then
--       --   key = ''' .. key end
--
--       if value ~= nil and value ~= '' then
--         -- result = result .. '['.. key ..'] = ' .. Dump(value) .. ','
--         result = result .. '['.. key ..'],'
--       end
--
--     end
--
--   end
--
--   return result .. ' }'
-- end

cmp.setup({
  snippet = {
    expand = function(arguments)
      luasnip.lsp_expand(arguments.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),

  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    -- format = function(entry, vim_item)
      -- if entry.source.name == 'cmp_tabnine' then
      --   -- print(Dump(entry.completion_item.data.new_suffix))
      --   -- print(Dump(entry.completion_item.data.completion_metadata))
      --   print(tostring(entry.completion_item.data.completion_metadata.detail))
      --
      -- end
      --
      -- -- print(inspect(vim_item))
      -- -- print(tostring(entry))
      -- return vim_item
      --         -- -- if you have lspkind installed, you can use it like
      --         -- -- in the following line:
      --         -- -- vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = 'symbol'})
      --         -- -- vim_item.menu = source_mapping[entry.source.name]
      --         -- if entry.source.name == 'cmp_tabnine' then
      --         --     local detail = (entry.completion_item.data or {}).detail
      --         --     vim_item.kind = ''
      --         --     if detail and detail:find('.*%%.*') then
      --         --         vim_item.kind = vim_item.kind .. ' ' .. detail
      --         --     end
      --         --
      --         --     if (entry.completion_item.data or {}).multiline then
      --         --         vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
      --         --     end
      --         -- end
      --         -- local maxwidth = 80
      --         -- vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      --         -- return vim_item
      --   end,

    format = function(entry, vim_item)
      local cmp_kinds = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Field = '  ',
        Variable = '  ',
        Class = '  ',
        Interface = '  ',
        Module = '  ',
        Property = '  ',
        Unit = '  ',
        Value = '  ',
        Enum = '  ',
        Keyword = '  ',
        Snippet = '  ',
        Color = '  ',
        File = '  ',
        Reference = '  ',
        Folder = '  ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  ',
        Event = '  ',
        Operator = '  ',
        TypeParameter = '  ',
      }

      if entry.source.name == 'cmp_tabnine' then
        local detail = entry.completion_item.data.completion_metadata.detail
        detail = string.gsub(detail, '%s+', '')
        vim_item.kind = '  ' .. detail
      else
        vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind .. ' '
      end

      return vim_item
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 2 },
    { name = 'luasnip', max_item_count = 2 },
    -- { name = 'cmp_tabnine', max_item_count = 2 },
    { name = 'buffer', max_item_count = 2 },
    { name = 'path', max_item_count = 8 },
  }),
})
