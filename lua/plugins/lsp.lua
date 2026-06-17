local lua_config_options = {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

return {
  'neovim/nvim-lspconfig',
  lazy = false,
  keys = {
    { 'ge', vim.diagnostic.open_float, desc = 'Show Line Diagnostics' }
  },
  config = function()
    vim.lsp.enable('intelephense')

    vim.lsp.config('lua_ls', lua_config_options)
    vim.lsp.enable('lua_ls')
  end
}
