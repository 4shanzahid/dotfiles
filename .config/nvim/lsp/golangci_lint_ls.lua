return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go" },
	root_markers = { "go.mod", ".golangci.yml", ".golangci.yaml", ".git" },
	init_options = {
		command = (function()
			-- Detect golangci-lint version and use appropriate args
			local version_output = vim.fn.system({ "golangci-lint", "version" })
			local is_v2 = string.find(version_output, "version v2") ~= nil

			if is_v2 then
				return {
					"golangci-lint",
					"run",
					"--output.json.path=stdout",
					"--issues-exit-code=0",
					"--show-stats=false",
				}
			else
				return {
					"golangci-lint",
					"run",
					"--out-format=json",
					"--issues-exit-code=0",
					"--show-stats=false",
					"--print-issued-lines=false",
					"--print-linter-name=false",
				}
			end
		end)(),
	},
	settings = {
		golangci = {
			lint_timeout = "5m",
		},
	},
}
