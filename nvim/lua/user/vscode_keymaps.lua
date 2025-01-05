local keymap = vim.keymap.set
local opts = {}

-- remap leader key
keymap("n", "<Space>", "", opts)

keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "jk", "<Esc>", { expr = true, noremap = true })
keymap("i", "..", "->", opts)
keymap("i", "<a-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<a-S-j>", "<Esc>:t.<CR>==gi<Down>", opts)

keymap("v", "i", "<Esc>i", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<a-j>", ":m '>+1<CR>==gv=gv", opts)
keymap("v", "<a-k>", ":m '<-2<CR>==gv=gv", opts)

keymap("n", "<Tab>", ">>", opts)
keymap("n", "<S-Tab>", "<<", opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "dd", '"_dd', opts)
keymap("n", "<a-j>", ":m .+1<CR>==", opts)
keymap("n", "<a-k>", ":m .-2<CR>==", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)
keymap("n", "<C-k>", "<C-w><C-l>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("n", "<a-S-j>", ":t.<CR>==", opts)

-- cmd mappings
-- keymap("n", "<D-s>", ":w<CR>", opts) -- Save
-- keymap("n", "<D-c>", '"+y$', opts)
-- keymap("n", "<D-z>", "u", opts)
-- keymap("i", "<D-z>", "<Esc>u<CR>==gi", opts)
-- keymap("x", "<D-c>", '"+y', opts)
-- keymap("n", "<D-v>", '"*P', opts) -- Paste normal mode
-- keymap("v", "<D-v>", '"*P', opts) -- Paste visual mode
-- keymap("c", "<D-v>", "<C-R>+", opts) -- Paste command mode
-- keymap("i", "<D-v>", '<Esc>l"+Pli', opts) -- Paste insert mode
