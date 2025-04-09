return { {

  -- mini vim
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.surround').setup()
      require('mini.notify').setup()
      require('mini.comment').setup()
    end,
    version = false
  },

  -- My plugins here
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "alker0/chezmoi.vim",

  "hiphish/rainbow-delimiters.nvim",
  "gpanders/nvim-parinfer",
  {
    dir = "/Users/nathanbraun/code/github.com/nathanbraun/nvim-ai", -- Adjust this to your local path
    dev = true,
    config = function()
      require("nai").setup({
        openai = {
          model = "gpt-4o",
          temperature = 0.7,
        },
      })
    end,
  },
  {
    dir = "/Users/nathanbraun/code/github.com/nathanbraun/nvim-dumpling", -- Adjust this to your local path
    dev = true,
    config = function()
      require("dumpling").setup({
        format = "markdown", -- Output format: markdown, html, or screenshot
        cleaned = true,      -- Whether to clean the output
        render_js = true,    -- Whether to render JavaScript
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- vimwiki
  { "vimwiki/vimwiki",               branch = "dev" },

  -- zk
  "zk-org/zk-nvim",

  { "nathanbraun/vim-rainbow-lists", ft = "vimwiki" },

  -- math
  'jbyuki/nabla.nvim',

  -- LSP
  -- Mason for managing LSP servers, formatters, etc.
  'VonHeikemen/lsp-zero.nvim',
  'williamboman/mason.nvim',
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- cmp plugins
  "hrsh7th/nvim-cmp",    -- The completion plugin

  "hrsh7th/cmp-buffer",  -- buffer completions
  "hrsh7th/cmp-path",    -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
  "dcampos/cmp-snippy",  -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-calc",

  -- snippets
  -- use "L3MON4D3/LuaSnip" --snippet engine
  {
    "dcampos/nvim-snippy",
    config = function()
      require("snippy").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        enable_auto = true
      })
    end
  }, -- a bunch of snippets to use

  -- programming
  -- "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        ignore_filetypes = {
          markdown = true,
          vimwiki = true,
        }
      })
    end,
  },

  "jpalardy/vim-slime",

  -- use "wakatime/vim-wakatime"

  "whiteinge/diffconflicts",

  "junegunn/vim-peekaboo",

  "junegunn/fzf",
  "junegunn/fzf.vim",
  "junegunn/vim-easy-align",

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  "flazz/vim-colorschemes",
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- "tpope/vim-surround",
  -- "tpope/vim-commentary",

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- essentials
  -- "christoomey/vim-tmux-navigator",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  "tpope/vim-unimpaired",
  "kana/vim-arpeggio",
  -- "ap/vim-buftabline",
  {
    "akinsho/bufferline.nvim",
    config = function()
      require('bufferline').setup {}
    end
  },
  "mattn/calendar-vim",
  {
    "rlane/pounce.nvim",
    config = function()
      require 'pounce'.setup { accept_keys = "JKNPHLIUOMSDAFGVRBYTCEXWQZ" }
    end
  },
  {
    'smoka7/hop.nvim',
    -- tag = '*', -- optional but strongly recommended
    -- branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  "airblade/vim-rooter"
  -- "notjedi/nvim-rooter.lua",
} }
