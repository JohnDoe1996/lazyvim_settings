-- [[ Neo-tree 相关设置 ]]

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- 必需依赖
    "nvim-tree/nvim-web-devicons", -- 用于显示文件图标
  },

  opts = {
    filesystem = {
      -- source_selector = {
      --   winbar = true,
      --   statusline = true,
      -- },
      filtered_items = {
        visible = true, -- 不隐藏文件
        show_hidden_count = true, -- 显示隐藏文件数
        hide_dotfiles = false, -- 隐藏点开头的文件
        hide_gitignored = false, -- 隐藏 gitignore中的文件
        -- 隐藏特定名称的 文件/文件名， 显示隐藏文件模式下会显示
        hide_by_name = {
          ".DS_Store",
          ".venv",
          ".vscode",
          ".iead",
        },
        -- 不显示的文件（ 即使显示隐藏文件模式下也不显示
        never_show = {
          ".git",
          ".github",
        },
      },
    },
  },
}
