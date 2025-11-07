return {
  "tarides/ocaml.nvim",
  config = function()
    require('ocaml').setup()
    vim.lsp.enable('ocamllsp')
  end
}
