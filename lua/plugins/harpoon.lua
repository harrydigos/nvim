return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = (function()
    local keys = {
      {
        "<leader>A",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon file",
      },
      {
        "<leader>a",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon quick menu",
      },
    }

    for i = 1, 5 do
      keys[#keys + 1] = {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to file " .. i,
      }
    end

    return keys
  end)(),
}
