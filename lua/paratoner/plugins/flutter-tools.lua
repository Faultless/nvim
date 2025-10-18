return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "/Users/serge/development/flutter/bin/flutter",
        fvm = false,
        widget_guides = { enabled = true },
        lsp = {
          settings = {
            showtodos = true,
            analysisExcludedFolders = {},
            completefunctioncalls = true,
            renamefileswithclasses = "prompt",
            updateimportsonrename = true,
            enablesnippets = false,
          },
        },
      })
    end,
  },
}
