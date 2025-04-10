return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      auto_expand_width = true, -- expand the window when file exceeds the window width. does not work with position = "float"
      -- popup = { -- settings that apply to float position only
      --   size = {
      --     height = "80%",
      --     width = "50%",
      --   },
      -- },
      mappings = {
        w = false,
        h = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        l = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          if node.type == "directory" then
            if not node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            elseif node:has_children() then
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
          if node.type == "file" then
            require("neo-tree.utils").open_file(state, path)
          end
        end,
      },
    },
  },
}
