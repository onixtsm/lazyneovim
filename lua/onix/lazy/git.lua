return {
  {
    'tpope/vim-fugitive',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end
  }


}
