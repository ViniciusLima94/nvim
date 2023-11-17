-- Navigate between split windows with Cmd+h, j, k, l
-- keymaps.lua
local map = vim.api.nvim_set_keymap
local keymap=vim.keymap.set
-- Mappings for Magma
map("n", "<LocalLeader>r", ":MagmaEvaluateOperator<CR>", { noremap = true, silent = true, expr = true })
map("n", "<LocalLeader>rr", ":MagmaEvaluateLine<CR>", { noremap = true, silent = true })
map("x", "<LocalLeader>r", ":<C-u>MagmaEvaluateVisual<CR>", { noremap = true, silent = true })
map("n", "<LocalLeader>rc", ":MagmaReevaluateCell<CR>", { noremap = true, silent = true })
map("n", "<LocalLeader>rd", ":MagmaDelete<CR>", { noremap = true, silent = true })
map("n", "<LocalLeader>ro", ":MagmaShowOutput<CR>", { noremap = true, silent = true })
map("n", "<S-h>", "<C-W>h", { noremap = true, silent = true })
map("n", "<S-j>", "<C-W>j", { noremap = true, silent = true })
map("n", "<S-k>", "<C-W>k", { noremap = true, silent = true })
map("n", "<S-l>", "<C-W>l", { noremap = true, silent = true })
-- Generals Keymaps
-- Left Explorer Togglu
keymap("n", "<leader>e", ":Lexplore15<CR>")
-- Move text up and down
keymap("n", "<M-k>", ":m .-2<CR>==", {})
keymap("n", "<M-j>", ":m .+1<CR>==", {})
-- Move block text up and down
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", {})
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", {})

-- Send the senction of code to the terminal
map("n", "<leader>ss", [[:call jukit#send#section(0)<CR>]], { noremap = true, silent = true })
--Send the line of code to the terminal
map("n", "<leader>sa", [[:call jukit#send#line()<CR>]], { noremap = true, silent = true })
map("v", "<leader>cc", [[:call jukit#send#selection()<cr>]], { noremap = true, silent = true })
--gitlazy keymap
map("n", "<Leader>gg", [[:LazyGit<CR>]], { noremap = true, silent = true })
--telescope
-- See `:help telescope.builtin`
keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
keymap("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
keymap("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>o", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
-- keymap('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format the code' })
-- Key mapping to trigger the Format command
map("n", "<Leader>f", [[:Format<CR>]], { noremap = true, silent = true })
map("n", "n", "nzzzv", { noremap = true, silent = true })
