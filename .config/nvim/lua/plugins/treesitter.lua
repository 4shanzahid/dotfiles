return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
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
				"git_config",
				"git_rebase",
				"go",
				"gomod",
				"gosum",
				"helm",
				"json",
				"rust",
				"python",
				"yaml",
				"tmux",
				"regex",
				"json",
				"json5",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
