return {
  'nvim-neotest/neotest',
  lazy = true,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-phpunit'
  },
  keys = {
    { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, 'Run tests in current file' },
    { '<leader>ts', function() require('neotest').run.run() end, 'Run single test' }
  },
  config = function()
    require('neotest').setup({
      adapters = {
	require('neotest-phpunit')
      }
    })
  end,
}
