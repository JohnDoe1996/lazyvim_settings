--[[ 窗格相关插件 ]]

return {
  -- 切换绝对行号和相对行号的插件
  { "sitiom/nvim-numbertoggle" },

  -- 正在使用的窗口高亮
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },

  -- 显示对应的文件名
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
