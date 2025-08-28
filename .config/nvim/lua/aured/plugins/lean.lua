return {
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim', -- for 2 Lean specific 
    'andymass/vim-matchup', -- for enhanced % motion behavior
    'andrewradev/switch.vim', -- for switch support
    'tomtom/tcomment_vim', -- for commenting
  },

  ---@type lean.Config
  opts = { -- configurations here
    mappings = true,
  }

}
