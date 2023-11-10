require('bufferline').setup({
  options = {
    show_buffer_close_icons = false,
    separator_style = 'thick',
    numbers = 'ordinal',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'BufferLineTab',
        text_align = 'center',
        separator = true,
      }
    }
  },
})

local fixBufferLineSeparator = function()
  local baseGroup = vim.api.nvim_get_hl_by_name('NvimTreeWinSeparator', true);
  local additionalGroup = vim.api.nvim_get_hl_by_name('BufferLineTab', true);

  if (baseGroup.foreground == baseGroup.background) then
    baseGroup.foreground = additionalGroup.background
  end

  baseGroup.background = additionalGroup.background
  vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", baseGroup)
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = fixBufferLineSeparator })
fixBufferLineSeparator()

vim.keymap.set('n', '<leader>tp', '<cmd>BufferLineTogglePin<CR>', { noremap = true })

vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { noremap = true })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { noremap = true })

vim.keymap.set('n', '1', '<cmd>BufferLineGoToBuffer 1<CR>', { noremap = true })
vim.keymap.set('n', '2', '<cmd>BufferLineGoToBuffer 2<CR>', { noremap = true })
vim.keymap.set('n', '3', '<cmd>BufferLineGoToBuffer 3<CR>', { noremap = true })
vim.keymap.set('n', '4', '<cmd>BufferLineGoToBuffer 4<CR>', { noremap = true })
vim.keymap.set('n', '5', '<cmd>BufferLineGoToBuffer 5<CR>', { noremap = true })
vim.keymap.set('n', '6', '<cmd>BufferLineGoToBuffer 6<CR>', { noremap = true })
vim.keymap.set('n', '7', '<cmd>BufferLineGoToBuffer 7<CR>', { noremap = true })
vim.keymap.set('n', '8', '<cmd>BufferLineGoToBuffer 8<CR>', { noremap = true })
vim.keymap.set('n', '9', '<cmd>BufferLineGoToBuffer 9<CR>', { noremap = true })
