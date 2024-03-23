-- Navigate between split windows with Cmd+h, j, k, l
-- keymaps.lua
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
map("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-W>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-W>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })
-- Generals Keymaps
-- Left Explorer Togglu
-- keymap("n", "<leader>e", ":Lexplore15<CR>")
-- Move text up and down
keymap("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move block text up and down
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
--Keymaps for nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Send the section of code to the terminal
map("n", "<leader>ss", [[:call jukit#send#section(0)<CR>]], { noremap = true, silent = true })
--Send the line of code to the terminal
map("n", "<leader>sa", [[:call jukit#send#line()<CR>]], { noremap = true, silent = true })
--Send the all code  up to the cell to the terminal
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
keymap("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
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
map("x", "<leader>p", '"_dP', { noremap = true, silent = true })
map("n", "<Leader>f", [[:Format<CR>]], { noremap = true, silent = true })
--keep the cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", {})
keymap("n", "<C-u>", "<C-u>zz", {})
-- keep the cursor centered when searching
keymap("n", "n", "nzzzv", {})
keymap("n", "N", "Nzzzv", {})

-- Keymaps for Obsidian:
keymap('n',"<leader>nn",[[:ObsidianNew<CR>]])
keymap('n',"<leader>ot",[[:ObsidianTemplate<CR>]])
keymap('n',"<leader>gn",[[:ObsidianSearch<CR>]],{desc="[G]rep [N]otes"})
keymap('n',"<leader>oqs",[[:ObsidianQuickSwitch<CR>]])
keymap('n',"<leader>bl",[[:ObsidianBacklinks<CR>]])



