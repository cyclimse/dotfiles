local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Open WhichKey menu
map('n', '<Space>', ':WhichKey "<Space>"<CR>')

map('', '<leader>c', '"+y')
map('', '<leader>v', '"+p')

map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- CD to file directory
map('n', '<leader>w', '<CMD>cd %:p:h<CR>')

-- Go back
map('n', 'gb', '<C-^>')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Move line up or down
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Simpler tab navigation --
map('', '<C-Left>', ':tabprevious<CR>')
map('', '<C-Right>', ':tabnext<CR>')

-- Open FZF files
map('n', '<leader>h', ':Files<CR>')

-- LSP Diagnostics in FZF
map('n', '<leader>d', ':LspDiagnosticsAll<CR>')

map('n', '<leader>t', ':NvimTreeToggle<CR>')
