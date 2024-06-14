return {
	"ej-shafran/compile-mode.nvim",
	dependencies = { "m00qek/baleia.nvim" },
	opts = { default_command = "" },
	init = function()
		vim.keymap.set("n", "<leader>pc", "<cmd>Compile<cr>")
	end,
}
