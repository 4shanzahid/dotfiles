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
				enable = false,
				url = "",
			},
			-- Specific schemas for Docker and GitHub Actions
			schemas = {
				-- GitHub Actions Workflows
				["https://json.schemastore.org/github-workflow.json"] = {
					".github/workflows/*.yml",
					".github/workflows/*.yaml",
				},
				-- GitHub Action metadata
				["https://json.schemastore.org/github-action.json"] = {
					".github/action.yml",
					".github/action.yaml",
					"action.yml",
					"action.yaml",
				},
				-- Docker Compose - using the official Docker schema
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
					"docker-compose*.yml",
					"docker-compose*.yaml",
					"compose.yml",
					"compose.yaml",
				},
				-- Alternative Docker Compose schema (backup)
				["https://json.schemastore.org/docker-compose.json"] = {
					"docker-compose.yml",
					"docker-compose.yaml",
				},
			},
			-- Custom tags support (useful for Docker Compose)
			customTags = {
				"!Ref",
				"!Reference sequence",
				"!reference",
				"!include",
				"!extends",
			},
		},
		-- Disable RedHat telemetry
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
