return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"yamlls",
					"ts_ls",
					"tailwindcss",
					"eslint",
					"pyright",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"stylua",
					"gofumpt",
					"goimports-reviser",
					"prettier",
					"yamlfmt",
					"ruff",

					-- Linters
					"eslint_d",
					"golangci-lint",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Enable LSP servers using the new native API
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"golangci_lint_ls",
				"ts_ls",
				"tailwindcss",
				"eslint",
				"pyright",
				"yamlls",
			})

			-- Set up LspAttach autocommand for custom keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Custom keymaps that aren't defaults
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
