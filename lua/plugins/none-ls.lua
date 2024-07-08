return {
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
}
