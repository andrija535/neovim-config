return {
  'CopilotC-Nvim/CopilotChat.nvim',
  cmd = { 'CopilotChat' },

  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
    'ibhagwan/fzf-lua',
  },

  build = 'make tiktoken',

  opts = {
    model = 'gpt-4.1',
    temperature = 0.1,

    window = {
      layout = 'vertical',
      width = 0.25
    },

    headers = {
      user = '👤 You',
      assistant = '🤖 Copilot',
      tool = '🔧 Tool'
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages
  }
}
