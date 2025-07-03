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

			-- Global LSP configuration
			vim.lsp.config("*", {
				on_attach = function(client, bufnr)
					-- Custom keymaps that aren't defaults
					local opts = { buffer = bufnr, silent = true }
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- Enable completion for this buffer if using native completion
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, bufnr, {
							autotrigger = false, -- Set to true for auto-completion
						})
					end
				end,
			})
		end,
	},
}
