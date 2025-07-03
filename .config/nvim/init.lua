require("config.lazy")
require("core")

vim.diagnostic.config({
	virtual_text = {
		enabled = true,
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
	underline = true,
	update_in_insert = false, -- Don't update diagnostics in insert mode
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "",
	},
})
