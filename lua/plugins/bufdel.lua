require('bufdel').setup({
  quit = false,
})

-- MapN('<C-w>', '<cmd>BufDel<CR>')
MapN('<C-w>', function ()
  vim.cmd('BufDel');

  -- if vim.fn.buflisted(vim.fn.bufnr('#')) == 1 then
  if vim.api.nvim_buf_line_count(0) < 2 then
    vim.cmd('NvimTreeFindFileToggle');
    vim.cmd('NvimTreeFindFileToggle');
  end

end)

-- vim.api.nvim_create_autocmd('BufEnter', {
--   callback = function()
--     if vim.api.nvim_buf_get_name(0) == '' then
--       vim.cmd('NvimTreeFindFileToggle');
--       vim.cmd('NvimTreeFindFileToggle');
--     end
--   end
-- })
