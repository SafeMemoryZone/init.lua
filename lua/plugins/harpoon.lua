return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		vim.keymap.set("n", "<C-x>", require("harpoon.mark").add_file, { desc = "[M]ark file" })
		vim.keymap.set("n", "<C-m>", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle quick [M]enu" })
		vim.keymap.set("n", "<C-1>", function()
			require("harpoon.ui").nav_file(1)
		end, { desc = { "Navigate to file 1" } })
		vim.keymap.set("n", "<C-2>", function()
			require("harpoon.ui").nav_file(2)
		end, { desc = { "Navigate to file 2" } })
		vim.keymap.set("n", "<C-3>", function()
			require("harpoon.ui").nav_file(3)
		end, { desc = { "Navigate to file 3" } })
	end,
}
