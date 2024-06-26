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
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
    },
    init = function()
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    init = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "onedark",
    },
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
      },
    },
  },
  require("plugins/lspconfig"),
  require("plugins/cmp"),
  require("plugins/dap"),
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
