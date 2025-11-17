return {
  "tarides/ocaml.nvim",
  ft = { "ocaml", "ocamllex", "ocamlyacc", "dune" },
  config = function()
    require('ocaml').setup()
    vim.lsp.enable('ocamllsp')
  end
}
