return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "prettier", "eslint" },
      typescriptreact = { "prettier", "eslint" },
      javascript = { "prettier", "eslint" },
      javascriptreact = { "prettier", "eslint" },
    },

    formatters = {
      eslint = {
        command = "eslint_d", -- or "eslint"
        args = {
          "--fix-to-stdout",
          "--stdin",
          "--stdin-filename",
          "$FILENAME",
        },
        stdin = true,
        timeout_ms = 5000,
      },
    },
  },
}
