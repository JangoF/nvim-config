MapNVT('<C-h>', '<cmd>wincmd h<CR>')
MapNVT('<C-j>', '<cmd>wincmd j<CR>')
MapNVT('<C-k>', '<cmd>wincmd k<CR>')
MapNVT('<C-l>', '<cmd>wincmd l<CR>')
MapNVT('<C-s>', '<cmd>w!<CR>')

MapNVTI('<C-q>', '<cmd>qa<CR>')

MapN('<ESC>', '<cmd>nohlsearch<CR>')

MapN('<leader>vs', '<cmd>vsplit<CR>')

MapNV('<S-j>', '10j')
MapNV('<S-k>', '10k')
MapNV('<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')

MapV('<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')


-- function left_shift()
--   vim.api.nvim_command("normal! <")
--   vim.api.nvim_command("normal! gv")
-- end
--
-- function right_shift()
--   vim.api.nvim_command("normal! >")
--   vim.api.nvim_command("normal! gv")
-- end

function shift(direction)
  vim.api.nvim_command("normal! " .. direction)
  vim.api.nvim_command("normal! gv")
end


-- MapV('<', '<cmd>lua left_shift()<CR>')
-- MapV('>', '<cmd>lua right_shift()<CR>')
MapV('<', '<cmd>lua shift("<")<CR>')
MapV('>', '<cmd>lua shift(">")<CR>')
