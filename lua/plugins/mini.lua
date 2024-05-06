return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })
	end,
}
