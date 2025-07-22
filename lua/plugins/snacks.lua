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
  },
}
