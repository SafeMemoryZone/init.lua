return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                   ",
				"                                   ",
				"                                   ",
				"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
				"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
				"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
				"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
				"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
				"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
				"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
				" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
				" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
				"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
				"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
				"                                   ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert<CR>"),
				dashboard.button("r", "  > Recent files", ":Telescope oldfiles<CR>"),
				dashboard.button("l", "  > Lazy", ":Lazy<CR>"),
				dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
			}
			return dashboard.opts
		end,
		config = function(_, opts)
			require("alpha").setup(opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "night",
			light_style = "day",
			transparent = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
			keywords = {
				TODO = { icon = "", color = "info" },
			},
			highlight = {
				multiline = false,
				context = 10,
			},
		},
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "nightfly",
				section_separators = "",
				component_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_c = { "filename", "branch" },
				lualine_x = { "encoding", "fileformat", "filetype" },
			},
		},
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = { border = "rounded" },
			log_level = vim.log.levels.INFO,
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"html",
				"cssls",
				"quick_lint_js",
				"phpactor",
				"cmake",
				"ruff",
			},
			automatic_installation = true,
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = { "black", "ruff" },
			automatic_installation = true,
		},
		config = function(_, opts)
			require("mason-null-ls").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { shorten = 3 },
			},
			pickers = {
				find_files = { hidden = true },
			},
			extensions = {
				["fzf"] = {},
				["ui-select"] = {},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			opts.extensions["ui-select"] = require("telescope.themes").get_dropdown()
			telescope.setup(opts)

			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")

			local map = vim.keymap.set
			local builtin = require("telescope.builtin")
			map("n", "<leader>f", builtin.find_files, { desc = "Find files" })
			map("n", "<leader>pf", builtin.git_files, { desc = "Git files" })
			map("n", "<leader>tr", builtin.resume, { desc = "Resume picker" })
			map("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
			map("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Buffer search" })
			map("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Neovim config" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "c", "cpp", "python", "html", "css", "javascript", "php", "cmake" },
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			playground = { enable = true, updatetime = 25 },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local flags = { debounce_text_changes = 300 }
			local servers = {
				"lua_ls",
				"clangd",
				"pyright",
				"html",
				"cssls",
				"quick_lint_js",
				"phpactor",
				"cmake",
				"ruff",
			}

			for _, name in ipairs(servers) do
				lspconfig[name].setup({ capabilities = capabilities, flags = flags })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local bufopts = { buffer = ev.buf, remap = false }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
					vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
					vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, bufopts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
					vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "treesitter" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.black,
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
		},
		config = function(_, opts)
			require("oil").setup(opts)
		end,
		init = function()
			vim.keymap.set("n", "<leader>pv", function()
				require("oil").open(require("oil").get_curr_dir)
			end, { desc = "Open Oil file explorer" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local mark, ui = require("harpoon.mark"), require("harpoon.ui")
			vim.keymap.set("n", "<leader>x", mark.add_file, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
			for i = 1, 3 do
				vim.keymap.set("n", "<leader>" .. i, function()
					ui.nav_file(i)
				end, { desc = "Go to Harpoon file " .. i })
			end
		end,
	},
	{ "tpope/vim-sleuth",         event = { "BufReadPre", "BufNewFile" } },
	{ "vim-utils/vim-man",        cmd = "Man" },
	{ "ThePrimeagen/vim-be-good", cmd = "BeGood" },
	{ "tpope/vim-fugitive",       cmd = { "Git", "G" } },
	{ "tpope/vim-commentary",     keys = { "gc" } },
}
