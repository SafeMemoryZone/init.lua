return {
	"Civitasv/cmake-tools.nvim",
	opts = { cmake_build_directory = "build" },
	cmake_soft_link_compile_commands = false,
	cmake_compile_commands_from_lsp = true,
	init = function()
		vim.keymap.set("n", "<leader>mc", "<cmd>CMakeBuild<cr>")
		vim.keymap.set("n", "<leader>mr", "<cmd>CMakeRun<cr>")
		vim.keymap.set("n", "<leader>ms", "<cmd>CMakeTargetSettings<cr>")
	end,
}
