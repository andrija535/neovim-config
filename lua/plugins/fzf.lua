return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Search" },
    { "<leader>fbl", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fbgh", "<cmd>FzfLua git_bcommits<cr>", desc = "Git Commits For Buffer" },
  },
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({})
    fzf.register_ui_select()
  end,
}
