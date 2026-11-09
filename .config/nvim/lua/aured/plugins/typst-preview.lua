return {
  'chomosuke/typst-preview.nvim',
  lazy = false,  -- or ft = 'typst'
  version = '1.*',
  opts = {},
  keys = {
    { "<leader> tl", "<cmd>TypstPreview<CR>", desc = "preview" },
    { "<leader> tc", "<cmd>TypstPreviewFollowCursor<CR>", desc = "follow cursor" },
    { "<leader> tn", "<cmd>TypstPreviewNoFollowCursor<CR>", desc = "no follow cursor" },
    { "<leader> th", "<cmd>TypstPreviewFollowCursorToggle<CR>", desc = "follow cursor toggle" },
    { "<leader> tz", "<cmd>TypstPreviewStop<CR>", desc = "stop" },
    { "<leader> tx", "<cmd>TypstPreviewSyncCursor<CR>", desc = "sync cursor" },
    { "<leader> tt", "<cmd>TypstPreviewToggle<CR>", desc = "no follow cursor" },
    { "<leader> tu", "<cmd>TypstPreviewUpdate<CR>", desc = "update" },
  }
}


