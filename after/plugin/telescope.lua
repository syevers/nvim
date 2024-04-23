-- Load the builtin Telescope functions
local builtin = require('telescope.builtin')

-- Key mappings for various Telescope functions using Neovim's keymap API
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "find file [telescope]" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "find git file [telescope]" })
--vim.keymap.set('n', '<leader>ps', function()
--    builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end, { desc = "search all files in dir [telescope]" })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "search all files in dir [telescope] " })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "view builtin vim help tags [telescope]" })
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, { desc = "show references [telescope]" })
vim.keymap.set('n', '<leader>pi', builtin.lsp_implementations, { desc = "get implementations [telescope]" })
vim.keymap.set('n', '<leader>pd', builtin.lsp_definitions, { desc = "go to def [telescope]" })
