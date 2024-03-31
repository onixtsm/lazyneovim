local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
            'require'
          }
        }
      },
      telemetry = {
        enable = false
      }
    }
  },
  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    }
  }
}

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end


  if client.server_capabilities.hoverProvider then
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ss', require('telescope.builtin').lsp_document_symbols, '[S]search [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('<C-m>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<Leader>b', function()
    vim.lsp.buf.format({ async = true })
  end, '[B]eautify')

  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  nmap('<space>e', vim.diagnostic.open_float, 'floating diagnostic')
  nmap('[d', vim.diagnostic.goto_prev, 'Previous dianostic')
  nmap(']d', vim.diagnostic.goto_next, 'Next diagnostic')
  nmap('<space>q', vim.diagnostic.setloclist, 'Setloclist')

  if client.config.root_dir ~= nil then
    client.config.root_dir = require('nvim-lspconfig').util.root_patter("Makefile", "build.sh", ".git",
      "compile_command.js")
  end

  if client.config.root_dir ~= nil then
    vim.api.nvim_set_current_dir(client.config.root_dir)
  end
end

local mason_config = function()
  require("mason").setup()
end

local mason_lsp_config = function()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_install = true,
    handlers = { function(server_name)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local server = require('lspconfig')[server_name]
      server.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        servers[server_name],
      }
    end
    }
  })
end

return {
  "williamboman/mason-lspconfig.nvim",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = mason_lsp_config,
  dependencies = {
    { "williamboman/mason.nvim", config = mason_config },
    { "neovim/nvim-lspconfig",   config = nvim_lsp_config },
    { "folke/neoconf.nvim",      config = neoconf_config }
  }
}
