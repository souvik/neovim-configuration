local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 5 -- the amount in ms that a plugin load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerComplie if there are changes in this file
  local function packer_init()
    local fn = vim.fn

    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
      })
      print('Installing packer close and reopen NeoVIM')
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    -- My plugins here
    use {
      "akinsho/toggleterm.nvim",
      config = function()
        require("config.toggleterm")
      end,
    }

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Colorscheme
    use {
      "morhetz/gruvbox",
      config = function()
        require("config.colorscheme")
      end,
    }

    -- Auto-completion plugins
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua"
      },
      config = function()
        require("config.cmp")
      end,
    }

    -- Snippets
    use { "L3MON4D3/LuaSnip" } -- snippet engine
    use { "rafamadriz/friendly-snippets" } -- A bunch of colorschemes you can try out

    -- LSP
    use {
      "neovim/nvim-lspconfig", -- enable LSP
      requires = {
        "williamboman/nvim-lsp-installer", -- simple to use language server install
        "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
      },
      config = function()
        require("config.lsp")
      end,
    }

    -- Syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end,
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.telescope")
      end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("config.autopairs")
      end,
    }

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.gitsigns")
      end,
    }

    -- NERDTree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("config.nvim-tree")
      end,
    }

    -- Bufferline
    use {
      "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("config.bufferline")
      end,
    }
    use { "moll/vim-bbye" }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require('packer').sync()
    end
  end

  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])

  packer_init()

  local status_ok, packer = pcall(require, "packer")
  if not status_ok then
    return
  end

  packer.init(conf)
  packer.startup(plugins)
end

return M
