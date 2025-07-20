return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
  },

  config = function()
    local nightfox = require("nightfox")
    local Shade = require("nightfox.lib.shade")

    local matte_black_palette = {
      -- Base "Matte Black" Palette Overrides
      bg0 = "#0D0D0D",
      bg1 = "#121212",
      bg2 = "#1E1E1E",
      bg3 = "#2C2C2C",
      bg4 = "#333333",
      fg0 = "#FFFFFF",
      fg1 = "#BEBEBE",
      fg2 = "#BEBEBE",
      fg3 = "#999999",
      sel0 = "#4A4A4A",
      sel1 = "#5A4A2A",
      comment = "#555555",
      red = Shade.new("#D35F5F", "#E06F6F", "#B91C1C"),
      orange = Shade.new("#F59E0B", "#FFC107", "#E08A00"),
      yellow = Shade.new("#FFC107", "#FFD12A", "#F59E0B"),
      white = Shade.new("#EAEAEA", "#FFFFFF", "#BEBEBE"),
      black = Shade.new("#333333", "#8A8A8D", "#1E1E1E"),
      green = Shade.new("#9BAF8C", "#B5C7A6", "#7F8D72"),
      cyan = Shade.new("#99BBCC", "#B3CDE4", "#7F9BAA"),
      blue = Shade.new("#9BB0CF", "#B5CCEE", "#8195B2"),
      magenta = Shade.new("#C1A1C1", "#D9B9D9", "#A989A9"),
      pink = Shade.new("#D398A7", "#EBC0CB", "#B97E8D"),

      -- Lualine Palette Extensions
      lualine_normal_bg = "#F59E0B",
      lualine_insert_bg = "#B91C1C",
      lualine_visual_bg = "#C1A1C1",
      lualine_command_bg = "#F59E0B",
      lualine_inactive_bg = "#1A1A1A",

      -- Treesitter Palette Extensions
      ts_parameter = "#D398A7",
      ts_property = "#EAEAEA",
    }

    local final_palettes = {
      carbonfox = require("nightfox.lib.collect").deep_extend(
        require("nightfox.palette").load("carbonfox"),
        matte_black_palette
      ),
    }

    local specs = {
      carbonfox = {
        syntax = {
          keyword = "red", -- "local", "function", "if"
          conditional = "red",
          statement = "red",
          func = "orange",
          string = "orange.dim",
          number = "orange",
          operator = "yellow",
          variable = "white",
          ident = "white.dim",
          const = "white",
          type = "white",
          field = "white.dim",
          comment = "comment",
        },
        diag = {
          error = "red",
          warn = "yellow",
          info = "cyan",
          hint = "magenta",
        },
      },
    }

    local groups = {
      all = {
        -- Base Groups
        Whitespace = { fg = "palette.black.bright" },
        NonText = { fg = "palette.black" },
        IncSearch = { bg = "palette.sel1" },

        -- Noice Cmdline Overrides
        NoiceCmdlinePopupBorder = { fg = "palette.fg3" },
        NoiceCmdlinePopupTitle = { fg = "palette.fg3", style = "bold" },
        NoiceCmdlinePopupBorderSearch = { fg = "palette.fg3" },
        NoiceCmdlinePopupTitleSearch = { fg = "palette.fg3", style = "bold" },
        NoiceCmdLineIcon = { fg = "palette.red" },

        -- Neo-tree overrides
        NeoTreeNormal = { bg = "palette.bg0" },
        NeoTreeNormalNC = { link = "NeoTreeNormal" },
        NeoTreeDirectoryName = { fg = "palette.fg3" },
        NeoTreeDirectoryIcon = { fg = "palette.fg3" },
        NeoTreeRootName = { fg = "palette.orange", style = "bold" },
        NeoTreeGitAdded = { fg = "palette.green" },
        NeoTreeGitModified = { fg = "palette.yellow" },
        NeoTreeGitDeleted = { fg = "palette.red" },
        NeoTreeGitIgnored = { fg = "palette.comment" },
        NeoTreeC = { fg = "palette.orange", bg = "palette.sel0" },

        -- Dashboard overrides
        SnacksDashboardHeader = { fg = "palette.fg3" },
        SnacksDashboardIcon = { fg = "palette.fg1" },
        SnacksDashboardDir = { fg = "palette.orange" },
        SnacksDashboardFile = { fg = "palette.fg3" },
        SnacksDashboardFooter = { fg = "palette.fg3" },
        SnacksDashboardKey = { fg = "palette.orange" },
        SnacksDashboardDesc = { fg = "palette.fg1" },
        SnacksDashboardSpecial = { fg = "palette.fg1" },

        -- Treesitter overrides
        ["@comment"] = { fg = "palette.comment", style = "italic" },
        ["@keyword"] = { fg = "palette.red", style = "bold" },
        ["@keyword.function"] = { fg = "palette.red", style = "bold" },
        ["@keyword.operator"] = { fg = "palette.red", style = "bold" },
        ["@function"] = { fg = "palette.orange", style = "bold" },
        ["@function.builtin"] = { fg = "palette.orange", style = "bold" },
        ["@function.call"] = { fg = "palette.orange" },
        ["@string"] = { fg = "palette.orange" },
        ["@number"] = { fg = "palette.orange" },
        ["@operator"] = { fg = "palette.yellow" },
        ["@variable"] = { fg = "palette.white" },
        ["@constant"] = { fg = "palette.white" },
        ["@type"] = { fg = "palette.white.dim" },
        ["@variable.parameter"] = { fg = "palette.ts_parameter", style = "italic" },
        ["@property"] = { fg = "palette.ts_property" },
        ["@field"] = { fg = "palette.ts_property" },
      },
    }

    nightfox.setup({
      options = {
        style = "carbonfox",
        terminal_colors = true,
        dim_inactive = true,
        styles = { comments = "italic", functions = "bold", keywords = "bold" },
        modules = {
          neotree = true,
          treesitter = true,
        },
      },
      palettes = final_palettes,
      specs = specs,
      groups = groups,
    })

    vim.cmd("colorscheme carbonfox")

    -- Lualine overrides
    local lualine_theme = {
      normal = {
        a = { fg = matte_black_palette.bg0, bg = matte_black_palette.lualine_normal_bg, gui = "bold" },
        b = { fg = matte_black_palette.fg1, bg = matte_black_palette.lualine_inactive_bg },
        c = { fg = matte_black_palette.fg2, bg = matte_black_palette.lualine_inactive_bg },
      },
      insert = {
        a = { fg = matte_black_palette.bg0, bg = matte_black_palette.lualine_insert_bg, gui = "bold" },
        b = { fg = matte_black_palette.fg1, bg = matte_black_palette.lualine_inactive_bg },
        c = { fg = matte_black_palette.fg2, bg = matte_black_palette.lualine_inactive_bg },
      },
      visual = {
        a = { fg = matte_black_palette.bg0, bg = matte_black_palette.lualine_visual_bg, gui = "bold" },
        b = { fg = matte_black_palette.fg1, bg = matte_black_palette.lualine_inactive_bg },
        c = { fg = matte_black_palette.fg2, bg = matte_black_palette.lualine_inactive_bg },
      },
      command = {
        a = { fg = matte_black_palette.bg0, bg = matte_black_palette.lualine_command_bg, gui = "bold" },
        b = { fg = matte_black_palette.fg1, bg = matte_black_palette.lualine_inactive_bg },
        c = { fg = matte_black_palette.fg2, bg = matte_black_palette.lualine_inactive_bg },
      },
      inactive = {
        a = { fg = matte_black_palette.fg3, bg = matte_black_palette.lualine_inactive_bg },
        b = { fg = matte_black_palette.fg3, bg = matte_black_palette.lualine_inactive_bg },
        c = { fg = matte_black_palette.comment, bg = matte_black_palette.lualine_inactive_bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = lualine_theme,
      },
    })
  end,
}