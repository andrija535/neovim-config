return {
  'olimorris/codecompanion.nvim',
  opts = {
    display = {
      chat = {
	window = {
	  layout = 'vertical',
	  width = 0.25
	}
      }
    }
  },
  cmd = {'CodeCompanion', 'CodeCompanionChat'},
  keys = {
    {'<leader>cc', '<cmd>CodeCompanionChat<cr>', desc = 'Code Companion Chat'},
    {'<leader>ci', '<cmd>CodeCompanion<cr>', mode = {'n','v'}, desc = 'Code Companion Inline'},
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
