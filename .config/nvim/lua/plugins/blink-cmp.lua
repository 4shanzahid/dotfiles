return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },

				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "mono",
					kind_icons = {
						Text = "󰉿",
						Method = "󰊕",
						Function = "󰊕",
						Constructor = "󰒓",
						Field = "󰜢",
						Variable = "󰆦",
						Property = "󰖷",
						Class = "󱡠",
						Interface = "󱡠",
						Struct = "󱡠",
						Module = "󰅩",
						Unit = "󰪚",
						Value = "󰦨",
						Enum = "󰦨",
						Keyword = "󰻾",
						Snippet = "󱄽",
						Color = "󰏘",
						File = "󰈔",
						Reference = "󰬲",
						Folder = "󰉋",
						Event = "󱐋",
						Operator = "󰪚",
						TypeParameter = "󰬛",
					},
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					providers = {},
				},
				keymap = {
					preset = "enter",
					["<C-e>"] = { "hide", "fallback" },
					["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
				},
				cmdline = {
					enabled = false,
				},
				completion = {
					accept = {
						auto_brackets = {
							enabled = true,
						},
					},
					menu = {
						border = "rounded",
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", gap = 0 },
								{ "kind" },
							},
						},
					},
					documentation = {
						window = {
							border = "rounded",
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
