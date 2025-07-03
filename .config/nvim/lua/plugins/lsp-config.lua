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
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Get capabilities from nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure LSP servers using the new vim.lsp.config() API
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
				filetypes = { "lua" },
			})

			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				capabilities = capabilities,
				root_markers = { "go.mod", ".git" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
			})

			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities,
				root_markers = { "package.json", "tsconfig.json", ".git" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				capabilities = capabilities,
				root_markers = { "tailwind.config.js", "tailwind.config.ts", ".git" },
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
				},
			})

			vim.lsp.config("eslint", {
				cmd = { "vscode-eslint-language-server", "--stdio" },
				capabilities = capabilities,
				root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json", ".git" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
			})

			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				capabilities = capabilities,
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
				filetypes = { "python" },
			})

			vim.lsp.config("yamlls", {
				cmd = { "yaml-language-server", "--stdio" },
				capabilities = capabilities,
				root_markers = { ".git" },
				filetypes = { "yaml", "yml" },
				settings = {
					yaml = {
						format = {
							enable = true,
							singleQuote = true,
							printWidth = 120,
						},
						hover = true,
						completion = true,
						validate = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/json",
						},
						schemas = {
							kubernetes = "*.yaml",
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
							["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
							["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
							["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
							["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
						},
					},
				},
			})

			-- Enable all configured LSP servers
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"ts_ls",
				"tailwindcss",
				"eslint",
				"pyright",
				"yamlls",
			})

			-- Custom keymaps (note: many are now defaults in 0.11)
			-- K is already mapped to vim.lsp.buf.hover() by default
			-- gra is already mapped to vim.lsp.buf.code_action() by default
			-- You can still override if you prefer different keys:
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
		end,
	},
}
