local filetypes = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'bash', 'css', 'html', 'ruby', 'hyprlang', 'javascript', 'nasm', 'go', 'verilog', 'diff' }

return {{
    'nvim-treesitter/nvim-treesitter', lazy = true, build = ":TSUpdate", cmd = {"TSUpdateSync", "TSUpdate", "TSInstall"}, dependencies = {
        
  "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = filetypes,
            sync_installed = false,
            highlight = {
                enable = true
            },
            incremental_selection = {
            enable = true,
            keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-r>",
          },
    },
   }
   end
   },
   {
       "windwp/nvim-ts-autotag", ft = {'html', 'js'}, opts = {},
   }
}
