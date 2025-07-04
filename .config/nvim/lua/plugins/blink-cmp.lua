return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = function()
			vim.cmd("highlight Pmenu guibg=none")
			vim.cmd("highlight PmenuExtra guibg=none")
			vim.cmd("highlight FloatBorder guibg=none")
			vim.cmd("highlight NormalFloat guibg=none")
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "normal",
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					providers = {
						-- Provider-specific configurations go here
					},
				},
				keymap = {
					["<C-f>"] = {},
					-- Fixed: Add Enter key to accept suggestions
					["<CR>"] = { "accept", "fallback" },
				},
				cmdline = {
					enabled = false,
					completion = { menu = { auto_show = true } },
					sources = {
						min_keyword_length = 2,
					},
					keymap = {
						["<CR>"] = { "accept_and_enter", "fallback" },
					},
				},
				completion = {
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
