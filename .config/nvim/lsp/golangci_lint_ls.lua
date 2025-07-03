return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go" },
	root_markers = { "go.mod", ".golangci.yml", ".golangci.yaml", ".git" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--out-format=json",
			"--issues-exit-code=0", -- Key change: don't exit with error on issues
			"--print-issued-lines=false",
			"--print-linter-name=false",
		},
	},
}
