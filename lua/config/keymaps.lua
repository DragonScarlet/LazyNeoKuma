local keymap = vim.keymap.set
vim.g.mapleader = " "

-- Autoformat
keymap("n", "<leader>F", ":lua vim.lsp.buf.format() <CR>", { desc = "File Format" })

-- File
keymap("n", "<leader>fc", ":%yank +<CR>", { desc = "File Copy" })
keymap("n", "<leader>fp", ":%delete | put +<CR>", { desc = "File Paste" })

-- Code
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
keymap("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover" })
keymap("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = "Signature" })

-- Dap
vim.fn.sign_define('DapBreakpoint', { text = '󰱯', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '󰞇', texthl = '', linehl = '', numhl = '' })
keymap('n', '<leader><Left>', ":DapContinue<CR>")
keymap('n', '<leader><Right>', ":DapStepOver<CR>")
keymap('n', '<leader><Down>', ":DapStepInto<CR>")
keymap('n', '<leader><Up>', ":DapStepOut<CR>")
keymap('n', '<leader>db', ":DapToggleBreakpoint<CR>")

-- Term
keymap("n", "<leader>t", "<Cmd>ToggleTerm<CR>", { desc = "Terminal" })
