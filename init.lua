require('config.lazy')

vim.opt.shiftwidth=2
vim.opt.smartindent=false

-- Avoid Copilot clashes, also honestly it's sometimes annoying when you want to press tab
-- and it applies the suggestions without you wanting to
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

-- Default colour scheme
vim.cmd('colorscheme kanagawa')
