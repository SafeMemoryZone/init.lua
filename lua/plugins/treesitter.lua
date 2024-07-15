return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context"
    }
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
}
