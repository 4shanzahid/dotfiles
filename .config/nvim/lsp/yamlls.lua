return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },
	root_markers = { ".git" },
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
			},
		},
	},
}
