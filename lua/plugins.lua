-- TODO: surround and comment
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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				comments = { bold = true },
			},
		},
		init = function()
			vim.cmd("colorscheme tokyonight")
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
		"ojroques/nvim-hardline",
		config = function()
			require("hardline").setup({
				theme = "nordic",
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
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.offsetEncoding = { "utf-16" }

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.quick_lint_js.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("K", vim.lsp.buf.hover, "Hover over symbol")
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>a", vim.lsp.buf.code_action, "Code [A]ction")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
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
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "luasnip", max_item_count = 5 },
					{ name = "nvim_lua", max_item_count = 5 },
					{ name = "treesitter", max_item_count = 5 },
				}, {
					{ name = "buffer", max_item_count = 5 },
				}),
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.diagnostics.cppcheck.with({
						extra_args = { "--check-level=exhaustive" },
					}),
				},
			})
			vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					separator = "-",
				},
			},
		},
		config = function()
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
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
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			{
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = false,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>pv", function()
				require("oil").open(require("oil").get_curr_dir)
			end, { desc = "Open current dir" })
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			vim.keymap.set("n", "<leader>mm", require("harpoon.mark").add_file, { desc = "[M]ark file" })
			vim.keymap.set("n", "<C-m>", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle quick [M]enu" })
			for i = 1, 3 do
				vim.keymap.set("n", string.format("<C-%d>", i), function()
					require("harpoon.ui").nav_file(i)
				end, { desc = { string.format("Navigate to file %d", i) } })
			end
		end,
	},
	{ "tpope/vim-sleuth" },
	{ "vim-utils/vim-man" },
}
