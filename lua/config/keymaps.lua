-- Generals Keymaps
-- Left Explorer Toggle 
vim.keymap.set('n','<leader>e',':Lexplore15<CR>')
-- Move text up and down
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", {})
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", {})
-- Move block text up and down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv",{} )

-- Send the block of code to the terminal
vim.api.nvim_set_keymap('n', '<leader>sa', [[:call jukit#send#section(0)<CR>]], { noremap = true, silent = true })
--Send the line of code to the terminal
vim.api.nvim_set_keymap('n', '<leader>sl', [[:call jukit#send#line()<CR>]], { noremap = true, silent = true })
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
