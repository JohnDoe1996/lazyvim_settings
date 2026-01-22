return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
        override_prompt_dir = function()
            -- 确定提示目录的逻辑
            return vim.fn.expand("~/.config/nvim/avante_prompts")
        end,

      --  provider = "deepseek",
      provider = "aliyun_qwen",
      -- vendors = {
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          max_tokens = 8192,
        },
        aliyun_qwen = {
          __inherited_from = "openai",
          api_key_name = "DASHSCOPE_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen-plus",
        },
        aliyun_deepseed = {
          __inherited_from = "openai",
          api_key_name = "DASHSCOPE_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "deepseek-v3.1",
        },
        
      },
    },
  },


    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
            adapters = {
                deepseek = function()
                return require("codecompanion.adapters").extend("deepseek", {
                    env = {
                        api_key = os.getenv("DEEPSEEK_API_KEY"),
                    },
                })
                end,
            },
            strategies = {
                chat = { adapter = "deepseek", },
                inline = { adapter = "deepseek" },
                agent = { adapter = "deepseek" },
            },
            })
        end
    }

}
