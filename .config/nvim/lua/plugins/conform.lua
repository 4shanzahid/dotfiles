return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>s",
			function()
				require("conform").format({ async = true }, function(err, did_edit)
					if not err and did_edit then
						vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
					end
				end)
			end,
			mode = { "n", "v" },
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
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
