vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Lazy
vim.keymap.set("n", "<leader>cl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Diff
vim.keymap.set('n', '<leader>dd', function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs < 2 then
    print("Need at least 2 listed buffers")
    return
  end

  local curr = vim.api.nvim_get_current_buf()

  -- find current buffer in listed order
  local next_buf
  for i, info in ipairs(bufs) do
    if info.bufnr == curr then
      -- wrap around to first if at end
      next_buf = bufs[i + 1] and bufs[i + 1].bufnr or bufs[1].bufnr
      break
    end
  end

  if not next_buf then
    print("Could not find next buffer")
    return
  end

  -- diff current with next buffer
  -- open vertical split with next buffer
  vim.cmd("vsplit")
  vim.api.nvim_set_current_buf(next_buf)
  vim.cmd("diffthis")

  -- go back to original and diff
  vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('#')))
  vim.cmd("diffthis")
end, { desc = "Diff current buffer with next buffer" })
