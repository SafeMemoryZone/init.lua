return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			{
				keymaps = {
					["<C-v>"] = "actions.select_vsplit",
					["<C-s>"] = "actions.select_split",
				},
			},
		})
		vim.keymap.set("n", "<leader>pv", function()
			oil.open(oil.get_curr_dir)
		end, { desc = "Open current dir" })
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
