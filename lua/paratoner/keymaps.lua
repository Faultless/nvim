-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
wk.add({
  { "<leader>h", group = "headers" }, -- group
  {
    "<leader>hc",
    mode = "n",
    function()
      local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
      if first_line and first_line:match("^/%*") then
        return
      end
      local header = {
        "/*",
        "* (C) Copyright Deli Home Holding B.V. 2025-2025 - All Rights Reserved",
        "*",
        "* This software may not be used, copied, modified, or distributed in any",
        "* form without express permission from Deli Home Holding B.V. Please contact",
        "* Deli Home Holding B.V. for license information.",
        "*/",
        "",
      }

      vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
    end,
    desc = "Insert header comment",
  },
})
