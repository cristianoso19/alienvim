local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "emmet_ls" then
    opts.filetypes = {"html", "css", "blade"}
  end

  opts.on_attach = on_attach

  server:setup(opts)
  vim.cmd [[do User LspAttachBuffers]]
end)
