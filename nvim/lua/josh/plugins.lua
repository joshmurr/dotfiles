-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	-- use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("sheerun/vim-polyglot")
	use("preservim/nerdcommenter")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use("nvim-lua/lsp-status.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use({
		"williamboman/nvim-lsp-installer",
		requires = "neovim/nvim-lspconfig",
	})
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	use("norcalli/nvim-colorizer.lua")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-writer.nvim",
		requires = { { "junegunn/fzf.vim" }, { "duane9/nvim-rg" } },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Colorscheme
	use("tanvirtin/monokai.nvim")

	-- Spectre - Find-and-Replace
	use({ "nvim-pack/nvim-spectre", requires = { { "nvim-lua/plenary.nvim" } } })

	-- DiffView
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
