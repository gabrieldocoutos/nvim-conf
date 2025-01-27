return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "mhartington/formatter.nvim" },
	{ "m4xshen/autoclose.nvim" },
	{ "mhinz/vim-signify" },
	{ "f-person/git-blame.nvim" },
	{ "ms-jpq/chadtree" },
	{ "ryanoasis/vim-devicons" },
	{ "sheerun/vim-polyglot" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "rafamadriz/friendly-snippets" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "sindrets/diffview.nvim" },
	{ "github/copilot.vim" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			height = 20,
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				output = { open_on_run = true },
				quickfix = {
					open = function()
						require("trouble").open({ mode = "quickfix", focus = false, height = 20 })
					end,
				},
				discovery = {
					enabled = false,
				},
				adapters = {
					require("neotest-go"),
					require("neotest-jest")({
						jestCommand = "yarn test",
						jestConfigFile = function(file)
							if string.find(file, "/packages/") then
								local match = string.match(file, "(.-/[^/]+/)src")
								return match
							end
							local cwd = vim.fn.getcwd()
							return cwd .. "/jest.config.js"
						end,
						jest_test_discovery = false,
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
}
