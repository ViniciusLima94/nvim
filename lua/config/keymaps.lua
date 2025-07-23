-- keymaps.lua
-- Navigate between split windows with Cmd+h, j, k, l
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
--
-- Keymaps for moving between windows
map("n", "<M-h>", "<C-W>h", opts)

map("n", "<M-k>", "<C-W>k", opts)
map("n", "<M-l>", "<C-W>l", opts)

-- Save and quit keybindings
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)

-- Shortcut to put ; at the end of the line
map("n", "<leader>;", "A;<esc>", opts)

-- Include and define shortcuts
map("n", "<leader>io", "I#include <stdio.h><CR><esc>", opts)
map("n", "<leader>lib", "I#include <stdlib.h><CR><esc>", opts)
map("n", "<leader>inc", "I#include", opts)
map("n", "<leader>def", "I#define", opts)

-- Additional shortcuts
map("n", "<leader>%", "i %>% ", opts)
map("n", "<leader><", "A<- ", opts)
map("n", "<leader>>", "A->", opts)

-- Select all
map("n", "<C-A>", "ggVG", opts)

-- Shortcut to add ::
map("n", "<leader>:", "A::", opts)

-- Add single and double comma at the end of the line
map("n", "<leader>'", "i'<esc>w'<esc>", opts)
map("n", '<leader>"', 'i"<esc>w"<esc>', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Generals Keymaps

-- Increase/decrease window width
map("n", "<C-j>", ":resize +1<CR>", opts)
map("n", "<C-k>", ":resize -1<CR>", opts)
map("n", "<C-h>", ":vertical resize -1<CR>", opts)
map("n", "<C-l>", ":vertical resize +1<CR>", opts)

--Keymaps for nvim tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Send the section of code to the terminal
map("n", "<leader>sc", ":IPythonCellExecuteCell<CR>", opts)
--Send the line of code to the terminal
map("n", "<leader>sa", ":IPythonCellExecuteCellJump<CR>", opts)
--Send the all code  up to the cell to the terminal
map("n", "<leader>cb", ":IPythonCellInsertBelow<CR>", opts)

--telescope
-- See `:help telescope.builtin`
keymap("n", "<C-p>", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader>?", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap(
	"n",
	"<leader>/",
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find,
	{ desc = "[/] Fuzzily search in current buffer" }
)
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

-- Key mapping to trigger the Format command
map("x", "<leader>p", '"_dP', opts)
map("n", "<Leader>f", [[:Format<CR>]], opts)

--keep the cursor centered when scrolling
-- keymap("n", "<C-d>", "<C-d>zz", {})
-- keymap("n", "<C-u>", "<C-u>zz", {})

-- keep the cursor centered when searching
keymap("n", "n", "nzzzv", {})
keymap("n", "N", "Nzzzv", {})

--Entering in writer mode
keymap("n", "<leader>p", [[:Pencil|ZenMode|set spell<CR>]])
