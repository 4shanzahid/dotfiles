require("config.lazy")
require("core")

-- Enable virtual text diagnostics (disabled by default in 0.11)
vim.diagnostic.config({
	virtual_text = {
		-- Enable virtual text
		enabled = true,
		-- Show source (language server name)
		source = "if_many",
		-- Prefix for virtual text
		prefix = "●",
		-- Show virtual text only on current line (optional, less cluttered)
		-- current_line = true,
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
