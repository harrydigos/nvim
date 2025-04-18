return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      expose_as_code_action = {},
    },
  },
  { "dmmulroy/ts-error-translator.nvim" },
  {
    "dmmulroy/tsc.nvim",
    opts = {
      auto_focus_qflist = true,
      use_diagnostics = true,
      -- run_as_monorepo = true,
      flags = {
        noEmit = true,
      },
    },
  },
}
