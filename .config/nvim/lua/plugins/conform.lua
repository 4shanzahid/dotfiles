return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>s",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "goimports-reviser" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "yamlfmt" },
			yml = { "yamlfmt" },
			markdown = { "prettier" },
			python = { "ruff_format", "ruff_organize_imports" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},

		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
