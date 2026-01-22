return {
  -- 函数注释插
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    -- dependencies = LazyVim.has("mini.snippets") and { "mini.snippets" } or {},
    cmd = "Neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    opts = {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    },
  },

  --  代码补全这只
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   enabled = true,
  --   opts = function(_, opts)
  --       return opts
  --   end,
  -- },

}
