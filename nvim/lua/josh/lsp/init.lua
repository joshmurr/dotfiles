local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("josh.lsp.lsp-installer")
require("josh.lsp.handlers").setup()
require("josh.lsp.null-ls")
