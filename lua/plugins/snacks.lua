return {
  "folke/snacks.nvim",
  desc = "Snacks File Explorer",
  recommended = true,
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },

    explorer = {
      enabled = false,  -- snacks和neotree 二选一即可
    },
  },
  keys = {
    {
      "<leader>fe",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    --
    -- -- leader + s + f/F  查找 不查找隐藏文件
    { "<leader>sf", LazyVim.pick("live_grep", { root = true, hidden = false, ignored = false }), desc = "Grep (root without hidden)" },
    { "<leader>sF", LazyVim.pick("live_grep", { root = false, hidden = false, ignored = false }), desc = "Grep (cwd without hidden)" },
  },
}
