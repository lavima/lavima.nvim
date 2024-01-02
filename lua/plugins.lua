return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-web-devicons" },
  { 
    'nvim-lualine/lualine.nvim', 
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  { 
    "williamboman/mason-lspconfig.nvim", 
    opts = { ensure_installed = { "pyright" } },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)  
    end 
  },
  { "ms-jpq/coq_nvim", branch = "coq" },
  { 
    "neovim/nvim-lspconfig",
    config = function()
      local coq = require("coq")
      require("lspconfig").pyright.setup(coq.lsp_ensure_capabilities({}))
    end 
  },
  { 
    "Vigemus/iron.nvim", 
    config = function() 
      require("iron.core").setup({
        config ={
          scratch_repl = false,
          repl_open_cmd = require("iron.view").split.vertical.botright(80),
          highlight_last = "IronLastSent"
        }
      }) 
    end 
  },
  { 'echasnovski/mini.comment', version = '*' },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})   
    end}
  },
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  },
  {
    'lavima/neonotebook.nvim',
    config = function()
      require('neonotebook').setup({})
    end
  }
}
