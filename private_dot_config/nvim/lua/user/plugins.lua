local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- vimwiki
  use {"vimwiki/vimwiki", branch = "dev"}
  use "michal-h21/vim-zettel"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- zk
  use "mickael-menu/zk-nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  use "flazz/vim-colorschemes"
  use { "nathanbraun/vim-rainbow-lists", ft = "vimwiki" }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- programming
  -- use "github/copilot.vim"
  use "jpalardy/vim-slime"
  use "kdheepak/lazygit.nvim"
  use "tpope/vim-surround"
  use "wakatime/vim-wakatime"
  use "tpope/vim-commentary"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- copilot
  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
  }
  use {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          ft_disable = { "markdown", "vimwiki"}
        })
      end, 100)
    end,
  }

  use {
    "prncss-xyz/neo-tree-zk.nvim",
    requires = {
      "nvim-neo-tree/neo-tree.nvim",
      "mickael-menu/zk-nvim"
    },
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function ()
        require("neo-tree").setup({
          sources = {
            "filesystem",
            "buffers",
            "zk"
          },
          zk = {
            follow_current_file = true,
            window = {
              mappings = {
                ["n"] = "change_query",
              },
            }
          }
        })
      end
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- essentials
  use "christoomey/vim-tmux-navigator" 
  use "tpope/vim-unimpaired"
  use "kana/vim-arpeggio"
  use "ap/vim-buftabline"
  use "mattn/calendar-vim"
  use { "rlane/pounce.nvim",
    config = function()
      require'pounce'.setup { accept_keys = "JKNPHLIUOMSDAFGVRBYTCEXWQZ" }
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use "airblade/vim-rooter"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

