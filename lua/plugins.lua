-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Syntax highlighting on steroids
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Lodash for lua
	use("nvim-lua/plenary.nvim")

	-- Awesome Fuzzy Finder
	use({ "nvim-telescope/telescope.nvim", tag = "*" })

	-- Nice colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Classics from vim era
	use("tpope/vim-abolish")
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")

	-- Git signs in gutter
	use("airblade/vim-gitgutter")

	-- All-in-one formatters, It's kind of slow so not sure I'll keep it.
	use("mhartington/formatter.nvim")

	-- All in one linters, Still need to be convinced about it.
	use("mfussenegger/nvim-lint")

	-- ready-to-go lsp config ta have a nice start (or not?)
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					---@diagnostic disable-next-line: param-type-mismatch
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	-- Launches a server to preview markdown files in watch mode
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- File explorer that let us edit file system like a buffer
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})
end)
