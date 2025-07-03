local mod_cache = nil

local function get_root(fname)
	if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
		local clients = vim.lsp.get_clients({ name = "gopls" })
		if #clients > 0 then
			return clients[#clients].config.root_dir
		end
	end
	return vim.fs.root(fname, { "go.work", "go.mod", ".git" })
end

return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)

		if mod_cache then
			on_dir(get_root(fname))
			return
		end

		-- Async GOMODCACHE detection
		vim.system({ "go", "env", "GOMODCACHE" }, { text = true }, function(result)
			if result.code == 0 and result.stdout then
				mod_cache = vim.trim(result.stdout)
			end
			vim.schedule(function()
				on_dir(get_root(fname))
			end)
		end)
	end,
	settings = {
		gopls = {
			gofumpt = true,
			usePlaceholders = true,
			completeUnimported = true,
		},
	},
}
