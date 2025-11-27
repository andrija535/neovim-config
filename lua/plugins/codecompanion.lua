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
    },
    -- This doesn't work, for some reason
    memory = {
      opts = {
	chat = {
	  default_memory = {'default'}
	}
      }
    },
    -- This whole ordeal is for setting the default Copilot model
    adapters = {
      http = {
	copilot = function()
	  return require('codecompanion.adapters').extend('copilot', {
	    schema = {
	      model = {
		default = 'gpt-5-mini'
	      }
	    }
	  })
	end
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
