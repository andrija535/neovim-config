return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  version = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {'php', 'ocaml'}

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {'php', 'ocaml'},
      callback = function()
	vim.treesitter.start()
	vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    })
  end
}
