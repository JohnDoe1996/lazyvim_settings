--[[ python 运行环境相关 ]]

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  -- Conda
  {
    "kmontocam/nvim-conda",
  },

  -- uv
  {
    "benomahony/uv.nvim",
    opts = {
      picker_integration = true,
    },
  },

  -- venv
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
