require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000},
    'fladson/vim-kitty',
    -- color codes in neovim
    "norcalli/nvim-colorizer.lua",
    -- changes "" or `` in a template
    "axelvc/template-string.nvim",
    --use("nvim-treesitter/playground")
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
    "https://github.com/tpope/vim-surround",
    --LSP
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', 
    dependencies = { 'nvim-lua/plenary.nvim' } },

    --{ "rose-pine/neovim", name = "rose-pine" }
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    },

    { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
},
{
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
}

  })
