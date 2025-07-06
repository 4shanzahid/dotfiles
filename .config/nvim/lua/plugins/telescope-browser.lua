return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {},
					},
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
