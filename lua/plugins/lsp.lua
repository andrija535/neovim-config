lua_config_options = {
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

local function phpactor_rename()
  local bufnr = vim.api.nvim_get_current_buf()
  local intel = vim.lsp.get_clients({ bufnr = bufnr, name = 'intelephense' })[1]

  local function rename_with_phpactor()
    local actor = vim.lsp.get_clients({ bufnr = bufnr, name = 'phpactor' })[1]
    if actor then
      vim.lsp.buf.rename(nil, { filter = function(c) return c.name == 'phpactor' end })
      return
    end

    local client_id = vim.lsp.start({
      name = 'phpactor',
      cmd = { 'phpactor', 'language-server' },
      root_dir = vim.fs.root(0, { '.git', 'composer.json' }),
      handlers = {
        ['textDocument/publishDiagnostics'] = function() end,
      },
    })

    if not client_id then
      vim.notify('phpactor: failed to start', vim.log.levels.ERROR)
      return
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      once = true,
      callback = function(args)
        if args.data.client_id == client_id then
          vim.lsp.buf.rename(nil, { filter = function(c) return c.name == 'phpactor' end })
        end
      end,
    })
  end

  if not intel then
    rename_with_phpactor()
    return
  end

  local params = vim.lsp.util.make_position_params(0, intel.offset_encoding)
  intel:request('textDocument/prepareRename', params, function(err, result)
    if not err and result then
      vim.lsp.buf.rename(nil, { filter = function(c) return c.name == 'intelephense' end })
    else
      rename_with_phpactor()
    end
  end, bufnr)
end

function on_attach(_, buffer)
  vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { buffer = buffer, desc = 'Show Line Diagnostics' })
end

return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    vim.lsp.enable('intelephense')

    vim.lsp.config('lua_ls', lua_config_options)
    vim.lsp.enable('lua_ls')

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        on_attach(nil, args.buf)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'intelephense' then
          vim.keymap.set('n', 'grn', phpactor_rename,
            { buffer = args.buf, desc = 'Rename (intelephense → phpactor fallback)' })
        end
      end
    })
  end
}
