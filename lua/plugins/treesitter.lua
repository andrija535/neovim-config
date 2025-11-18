return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
	enable = true
      },
      indent = {
	enable = true
      },
      ensure_installed = {
	'php'
      }
    }
  end
}
