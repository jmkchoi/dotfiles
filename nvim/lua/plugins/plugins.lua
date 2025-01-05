return {
  {
    'norcalli/nvim-colorizer.lua',
    name = 'colorizer'
  },
  {
    "ibhagwan/fzf-lua",
    name = "fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html" },
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- configs...
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
  },
}
