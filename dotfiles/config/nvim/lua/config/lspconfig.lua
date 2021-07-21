local lspconfig = require("lspconfig")
local lspstatus = require("lsp-status")

lspstatus.config({
  kind_labels = {},
  current_function = true,
  diagnostics = true,
  indicator_separator = ' ',
  indicator_errors = '',
  indicator_warnings = '',
  indicator_info = '',
  indicator_hint = '',
  indicator_ok = '',
  spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
  status_symbol = '',
  select_symbol = nil,
  update_interval = 100
})
lspstatus.register_progress()

local cmd = vim.cmd

local function map(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, {silent = true, noremap = true})
end

LspFormatFiletypes = {}

local function lsp_on_attach(client)
  map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("K",     "<Cmd>lua vim.lsp.buf.hover()<CR>")

  map("ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  map("gd", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("gf", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
  map("gr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
  map("gs", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  map("gS", "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

  map("gD", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  map("<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("1gD", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")

  local config = client.config
  if config.capabilities.textDocument.formatting then
    for _, ft in ipairs(config.filetypes) do
      print("Adding " .. ft)
      table.insert(LspFormatFiletypes, ft)
    end
  end

  lspstatus.on_attach(client)
end

-- Generic Language Server
lspconfig.efm.setup({
  on_attach = on_attach,
  filetypes = {"elixir", "sh"}
})

-- ElixirLS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.elixirls.setup({
  cmd = {"/opt/elixir-ls/language_server.sh"},
  on_attach = lsp_on_attach,
  capabilities = capabilities
})

-- Solargraph (Ruby LS)
lspconfig.solargraph.setup({on_attach = lsp_on_attach})

-- TypeScript/JavaScript
lspconfig.tsserver.setup({
  on_attach = lsp_on_attach,
  filetypes = {"typescript", "javascript", "typescriptreact"},
})

-- Terraform
lspconfig.terraformls.setup({on_attach = lsp_on_attach})

-- Diagnostic highlights and signs
cmd "sign define LspDiagnosticsSignError       text="
cmd "sign define LspDiagnosticsSignWarning     text="
cmd "sign define LspDiagnosticsSignInformation text="
cmd "sign define LspDiagnosticsSignHint        text="
