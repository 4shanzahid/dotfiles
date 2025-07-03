return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"javascript",
				"tsx",
				"typescript",
				"html",
				"bash",
				"c",
				"css",
				"gitcommit",
				"gitignore",
				"go",
				"helm",
				"json",
				"rust",
				"python",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
