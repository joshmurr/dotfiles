-- LSP-Installer

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("Error loading LSP-Installer")
	return
end


-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local status_ok, handler = pcall(require, "josh.lsp.handlers")
	if not status_ok then
		print("Failed to load handlers.")
		return
	end

	local opts = {
		on_attach = handler.on_attach,
		capabilities = handler.capabilities,
	}

	 --if server.name == "jsonls" then
		 --local jsonls_opts = require("josh.lsp.settings.jsonls")
		 --opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 --end

	 if server.name == "sumneko_lua" then
		 local sumneko_opts = require("josh.lsp.settings.sumneko_lua")
		 opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 --if server.name == "pyright" then
		 --local pyright_opts = require("josh.lsp.settings.pyright")
		 --opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 --end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
