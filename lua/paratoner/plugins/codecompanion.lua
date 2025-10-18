return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = {
    adapters = {
      qwen = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "http://localhost:8338",
            chat_url = "/v1/chat/completions",
            models_endpoint = "/v1/models",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "qwen",
      },
      inline = {
        adapter = "qwen",
      },
      cmd = {
        adapter = "qwen",
      },
    },
  },
}
