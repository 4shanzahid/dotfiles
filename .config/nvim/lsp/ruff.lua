return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
	init_options = {
		settings = {
			logLevel = "error",
		},
	},
	-- Disable hover in favor of Pyright
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
	end,
}
