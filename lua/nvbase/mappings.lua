local map = vim.keymap.set

map("n", "<leader>n", "<cmd>enew<CR>", { desc = "general buffer new" })
map("n", "<tab>", "<cmd> bnex <cr>", { desc = "general next Buffer" })
map("n", "<S-tab>", "<cmd> bprevious <cr>", { desc = "general nrev Buffer" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<C-h>", "<C-w>h", { desc = "general switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "general switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "general switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "general switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<PageUp>", "<ESC>^i", { desc = "general move beginning of line" })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<PageUp>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("n", "D", vim.diagnostic.open_float, { desc = "lsp show diagnostic error messages" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>sb", "<cmd>Telescope oldfiles<cr>", { desc = "telescope find oldfiles" })
map("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "telescope find buffers" })
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "telescope live grep" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "telescope find current word" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "telescope find diagnostics" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>sz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "telescope git files" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
