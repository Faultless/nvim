-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.add({
  { "<leader>h", group = "headers" },
  {
    "<leader>hc",
    mode = "n",
    desc = "Insert or replace header comment",
    function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false) -- get top 20 lines
      local start_idx, end_idx

      -- Detect old header (/* ... */ block at the top)
      for i, line in ipairs(lines) do
        if i == 1 and line:match("^/%*") then
          start_idx = 0
        end
        if start_idx and line:match("%*/") then
          end_idx = i
          break
        end
      end

      -- Remove old header if present
      if start_idx and end_idx then
        vim.api.nvim_buf_set_lines(0, start_idx, end_idx + 1, false, {})
      end

      -- Insert new header
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
  },
})
