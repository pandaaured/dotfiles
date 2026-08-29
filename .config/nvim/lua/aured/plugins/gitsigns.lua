return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

---- [NAVIGATION] --------------------------------------------------------------
      map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")

---- [ACTIONS] -----------------------------------------------------------------
      map("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage/unstage selection")
      map("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset selection")
      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gi", gs.preview_hunk_inline, "Preview hunk inline")

      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      ---- text object ------------------------------------------------------
      map({ "o", "x" }, "ih", "<Cmd>Gitsigns select_hunk<CR>", "Select hunk")
    end,
  },
}
