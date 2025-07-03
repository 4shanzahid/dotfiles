-- Set leader key
vim.g.mapleader = " "

-- Key mappings
vim.api.nvim_set_keymap("n", "<Leader><CR>", ":so ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":wa<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":wq<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leaderr>fb", ":Telescope file_browser<CR>", { desc = "File Browser" })
vim.keymap.set(
	"n",
	"<Leader>e",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = "File Browser (current file dir)" }
)

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
