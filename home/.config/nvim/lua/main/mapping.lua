vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Base
-- Выход из INSERT по нажатию jk или kj
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

-- Neotree
vim.keymap.set('n', '<C-f>', ':Neotree float focus<CR>')
vim.keymap.set('n', '<C-g>', ':Neotree float git_status<CR>')
-- Buffline
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
-- lsp mapping
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	-- group = vim.api.nvim_create_autogroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
		-- Save + format
		vim.keymap.set('n', '<C-s>', '<cmd>lua vim.lsp.buf.format()<CR>:w<CR>', opts)
	end
})
