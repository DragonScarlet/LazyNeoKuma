vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.undo/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.g.autoformat = false
-- vim.opt.colorcolumn = "80"
--vim.opt.clipboard = "unnamedplus"
--vim.cmd("highlight CursorInsert guibg=#9ece6a")
--vim.cmd("highlight CursorNormal guibg=#f7768e")
--vim.cmd("highlight CursorVisual guibg=#2ac3de")
-- Set guicursor option
--vim.o.guicursor = "n:CursorNormal,i:CursorInsert,v:CursorVisual"
