return {
	"nvim-lua/plenary.nvim",

	{
		"nvbase/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			dofile(vim.g.base46_cache .. "devicons")
			return {}
		end,
	},

	{
		"famiu/bufdelete.nvim",
		keys = {
			{ "<leader>x", "<cmd>lua  require('bufdelete').bufdelete(0, false) <cr>", desc = "Bdelete: Close Buffer" },
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		main = "ibl",
		opts = {
			indent = { char = "┊" },
			scope = { highlight = { "Normal" } },
		},
	},

	-- file managing , picker etc
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		},
		opts = function()
			return require("nvbase.configs.neotree")
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		opts = function()
			dofile(vim.g.base46_cache .. "whichkey")
			return {}
		end,
	},

	-- formatting!
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = { lua = { "stylua" } },
		},
	},

	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("nvbase.configs.gitsigns")
		end,
	},

	-- lsp stuff
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("nvbase.configs.mason")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("nvbase.configs.lspconfig").defaults()
		end,
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("nvbase.configs.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("nvbase.configs.cmp")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("nvbase.configs.telescope")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("nvbase.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		event = "User FilePost",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("nvbase.configs.ufo")
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "User FilePost",
		opts = { signs = false },
	},

	{
		"folke/trouble.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "right",
		},
		keys = {
			{ "<leader>ds", "<cmd>Trouble diagnostics<cr>", desc = "trouble diagnostic loclist" },
		},
	},
}
