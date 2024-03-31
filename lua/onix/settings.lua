vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ruler = true


vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.exrc = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 0

vim.opt.autowrite = true

vim.opt.wildmenu = true

vim.opt.clipboard = { 'unnamed', 'unnamedplus' }

vim.opt.iskeyword:append("-")

vim.cmd("au FocusLost * :wa")

vim.opt.mouse = 'a'

vim.opt.showcmd = false

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
