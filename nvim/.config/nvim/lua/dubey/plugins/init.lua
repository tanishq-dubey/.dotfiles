local fn = vim.fn

local dir = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(dir)) > 0 then
  bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    dir,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

local present, packer = pcall(require, "packer")
if not present then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("nvim-lua/plenary.nvim")

	use("folke/which-key.nvim") -- Useful popup dialog when doing things
  use("lambdalisue/suda.vim") -- Repoen files as sudo why not
  use("rcarriga/nvim-notify") -- Send notifications like a regular program
  use("windwp/nvim-autopairs") -- Good pairs for brackets and stuff

  use("wbthomason/packer.nvim") -- Packer can manage itself

  use{"akinsho/toggleterm.nvim", branch = 'main'} -- Terminal within vim
  use("lukas-reineke/indent-blankline.nvim") -- Show lines on indents for aligning

  use{"akinsho/bufferline.nvim", branch = 'main'} -- Snazzy buffer line (aka the tab bar at the top)
  use("kyazdani42/nvim-tree.lua") -- Tree explorer
  use("nvim-lualine/lualine.nvim") -- Status line (bottom bar)
  use("kyazdani42/nvim-web-devicons") -- Better icons for status line, tab bar, and tree explorer

  use("hrsh7th/nvim-cmp") -- Completion engine
  use("hrsh7th/cmp-buffer") -- Current buffers as a completion source
  use("hrsh7th/cmp-path") -- Machine paths as a completion source
  use("hrsh7th/cmp-cmdline") -- Vim command mode completions
  use("hrsh7th/cmp-nvim-lsp") -- The big daddy, use the LSP

  use("L3MON4D3/LuaSnip") -- Snippet engine for completion
	use("rafamadriz/friendly-snippets") -- Lots of useful snippets

  use({
		"nvim-treesitter/nvim-treesitter", -- The best syntax highlighting and context plugin
		run = ":TSUpdate",
	})

  use("onsails/lspkind-nvim") -- Pretty pictures when doing completions

  use("neovim/nvim-lspconfig") -- THE configurations for LSPs
  -- note: https://github.com/neovim/nvim-lspconfig#quickstart
  -- servers here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

  use("williamboman/nvim-lsp-installer") -- Installs LSP servers for us

  use("jose-elias-alvarez/null-ls.nvim") -- Neovim as a LSP (I don't really know what this does, but lots of people have it)
  use("ray-x/lsp_signature.nvim") -- Signature hints as you type
  use("kosayoda/nvim-lightbulb") -- VSCode like lightbulb
  use("stevearc/aerial.nvim") -- Code structure window

  use("nvim-telescope/telescope.nvim") -- Find files fast
  use("nvim-telescope/telescope-ui-select.nvim") -- Make the telescope ui Better
  use("nvim-telescope/telescope-media-files.nvim") -- Preview media (like images) in telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Use builtin fzf to make searching even better
  use({ "AckslD/nvim-neoclip.lua", requires = { "nvim-telescope/telescope.nvim" } }) -- Search the clipboard

  use("airblade/vim-gitgutter") -- Git symbols in the side

  use({
		"numToStr/Comment.nvim", -- Better commenting
		config = function()
			require("Comment").setup()
		end,
	})

  use({
		"folke/zen-mode.nvim", -- Zen mode (hide everything)
		config = function()
			require("zen-mode").setup({})
		end,
	})
	use({
		"folke/twilight.nvim", -- dim parts of code that are out of focus
		config = function()
			require("twilight").setup({})
		end,
	})

  use("anuvyklack/pretty-fold.nvim") -- Nicer folds
  use("goolord/alpha-nvim") -- Cool start page
	use({
		"Shatur/neovim-session-manager", -- Save a session for later
		requires = { "nvim-telescope/telescope.nvim" },
	})

  use("petertriho/nvim-scrollbar") -- Put a scrollbar on the side

  use({
    "catppuccin/nvim", -- The theme I like
    as = "catppuccin"
  })

  use("christoomey/vim-tmux-navigator") -- Use TMUX and Vim as one
  use("preservim/vimux") -- Send commands from vim to TMUX
  use("lifepillar/vim-gruvbox8") -- Another theme I like

  use("github/copilot.vim") -- Something that will obslete my job one day

  if bootstrap then
		require("packer").sync()
	end
end)
