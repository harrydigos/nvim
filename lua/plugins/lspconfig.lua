return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      wrap = true,
      inlay_hints = {
        enabled = false,
        exclude = {}, -- filetypes for which you don't want to enable inlay hints
      },
      -- servers = {
      --   eslint = {
      --     settings = {
      --
      --       -- Silent the stylistic rules in you IDE, but still auto fix them
      --       rulesCustomizations = {
      --         { rule = "style/*", severity = "off", fixable = true },
      --         { rule = "format/*", severity = "off", fixable = true },
      --         { rule = "*-indent", severity = "off", fixable = true },
      --         { rule = "*-spacing", severity = "off", fixable = true },
      --         { rule = "*-spaces", severity = "off", fixable = true },
      --         { rule = "*-order", severity = "off", fixable = true },
      --         { rule = "*-dangle", severity = "off", fixable = true },
      --         { rule = "*-newline", severity = "off", fixable = true },
      --         { rule = "*quotes", severity = "off", fixable = true },
      --         { rule = "*semi", severity = "off", fixable = true },
      --       },
      --     },
      --   },
      -- },
    },
  },
}
