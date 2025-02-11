
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 16
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "90"


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn="yes"
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.nf = "alpha"
-- vim.opt.conceallevel = 1

-- vim.opt.foldmethod = "indent"
