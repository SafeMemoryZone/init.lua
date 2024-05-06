return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		notify_on_error = false,
		format_on_save = { timeout_ms = 500, lsp_fallback = false },
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			rust = { "rustfmt" },
			asm = { "asmfmt" },
			python = { "isort", "black" },
		},
	},
}
