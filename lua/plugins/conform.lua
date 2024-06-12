return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		notify_on_error = false,
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		-- format_on_save = nil,
		-- format_after_save = nil,
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			rust = { "rustfmt" },
			asm = { "asmfmt" },
			python = { "isort", "black" },
			zig = { "zigfmt" },
		},
	},
}
