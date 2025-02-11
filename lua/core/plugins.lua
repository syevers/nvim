require("lazy").setup({
    -- THEMES
    --{ "rose-pine/neovim", name = "rose-pine" }
    { "catppuccin/nvim", name = "catppuccin" },
    { "loctvl842/monokai-pro.nvim", name="monokai-pro", priority = 1000 },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000},
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
    'matze/vim-move',
    -- "nvim-treesitter/nvim-treesitter-context",
    "https://github.com/tpope/vim-surround",
    {"tpope/vim-dadbod", lazy = true},
    -- w key motions
    "https://github.com/chaoren/vim-wordmotion",
    {'akinsho/toggleterm.nvim', version = "*", opts = {open_mapping = [[<c-\>]]}},
    { "nvim-tree/nvim-web-devicons", opts = {} },
    --LSP
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    -- LSP Support
    {'neovim/nvim-lspconfig', dependencies = {"jose-elias-alvarez/typescript.nvim"}},
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Autocompletion
    {'hrsh7th/nvim-cmp', priority = 100, lazy = false},
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'stevearc/conform.nvim',
    -- 'onsails/lspkind.nvim',
    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = {    'rafamadriz/friendly-snippets' },
        build = "make install_jsregexp",
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    },
    -- lazy.nvim
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    { "j-hui/fidget.nvim", opts = {} },

    -- {
    --     "kndndrj/nvim-dbee",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --     },
    --     build = function()
    --         -- Install tries to automatically detect the install method.
    --         -- if it fails, try calling it with one of these parameters:
    --         --    "curl", "wget", "bitsadmin", "go"
    --         require("dbee").install()
    --     end,
    --     config = function()
    --         require("dbee").setup(--[[optional config]])
    --     end,
    -- },
{
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
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
},

-- obsidian text editor, https://github.com/epwalsh/obsidian.nvim

{
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

  },
  opts = {
    workspaces = {
      {
        name = "coding",
        path = "/mnt/c/Users/dcbos/Documents/Obsidian",
      },
      -- {
      --   name = "school",
      --   path = "~/vaults/school",
      -- },
    },

  },
},



opts = {}, -- for default options, refer to the configuration section for custom setup.


  })
