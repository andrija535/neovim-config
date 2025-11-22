return {
  "olimorris/codecompanion.nvim",
  opts = {
    display = {
      chat = {
	window = {
	  layout = "vertical",
	  width = 0.25
	}
      }
    }
  },
  keys = {
    {"<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "Code Companion Chat"},
    {"<leader>ci", "<cmd>CodeCompanion<cr>", desc = "Code Companion Inline"},
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
