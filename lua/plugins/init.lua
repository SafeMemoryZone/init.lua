return {
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")
			dashboard.section.header.val = {
				[[                                                    ]],
				[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
				[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
				[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
				[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
				[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
				[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
				[[                                                    ]],
			}
			alpha.setup(dashboard.opts)
		end,
	},
	{
		"metalelf0/jellybeans-nvim",
		lazy = false,
		dependencies = {
			"rktjmp/lush.nvim",
		},
		priority = 1000,
		config = function()
			vim.cmd("colorscheme jellybeans-nvim")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		init = function()
			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
		end,
	},
	{ "ThePrimeagen/vim-be-good" },
	{
		"hedyhli/outline.nvim",
		config = function()
			vim.keymap.set("n", "<leader>ps", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
			require("outline").setup({
				keymaps = {
					goto_and_close = "d",
				},
			})
		end,
	},
	{
		"ojroques/nvim-hardline",
		config = function()
			require("hardline").setup({
				theme = "gruvbox",
				sections = {
					{ class = "mode", item = require("hardline.parts.mode").get_item },
					{ class = "med", item = require("hardline.parts.filename").get_item },
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { { "williamboman/mason.nvim", config = true } },
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"zls",
				"pyright",
				"html",
				"cssls",
				"denols",
				"intelephense",
        "cmake"
			},
		},
	},
	require("plugins/lspconfig"),
	require("plugins/cmp"),
	require("plugins/none-ls"),
	require("plugins/treesitter"),
	require("plugins/telescope"),
	{
		"Civitasv/cmake-tools.nvim",
		opts = {
			cmake_build_directory = "build",
			cmake_soft_link_compile_commands = false,
			cmake_compile_commands_from_lsp = true,
		},
		init = function()
			vim.keymap.set("n", "<leader>mc", "<cmd>CMakeBuild<cr>")
			vim.keymap.set("n", "<leader>mr", "<cmd>CMakeRun<cr>")
			vim.keymap.set("n", "<leader>ms", "<cmd>CMakeTargetSettings<cr>")
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			{
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = false,
				{
					keymaps = {
						["<C-v>"] = "actions.select_vsplit",
						["<C-s>"] = "actions.select_split",
					},
				},
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>pv", function()
				require("oil").open(require("oil").get_curr_dir)
			end, { desc = "Open current dir" })
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "vim-utils/vim-man" },
	{
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
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.surround").setup()
		end,
	},
}
