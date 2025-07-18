--[[ 使用界面相关 ]]
--
return {
  --主题切换
  -- { "ellisonleao/gruvbox.nvim" },  -- gruvbox theme
  -- { "projekt0n/github-nvim-theme" },   -- github-nvim theme
  { "navarasu/onedark.nvim", opts = { style = "dark" } }, --onedark theme
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "github_dark",  -- choose theme
      colorscheme = "onedark", -- choose theme
    },
  },

  -- 代码提示添加emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
