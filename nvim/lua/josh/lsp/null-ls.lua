local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Error loading Null-LS")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local function has_eslint_configured(utils)
	local c = utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
	local status = "ESLint config " .. (c and "found!" or "not found :(")
	vim.notify(status)
	return c
end

null_ls.setup({
	debug = false,
	-- Format on save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
	sources = {

		code_actions.eslint_d.with({ condition = has_eslint_configured }),
		diagnostics.eslint_d.with({ condition = has_eslint_configured }),
		formatting.eslint_d.with({ condition = has_eslint_configured }),
		formatting.prettier.with({
			-- Only register prettier if eslint_d is not running as a formatter. This
			-- can happen if it's not configured for this project, or if it can't
			-- handle the current filetype.
			--condition = function()
			--return #null_ls.get_source({ name = "eslint_d", method = null_ls.methods.FORMATTING }) == 0
			--end,
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		--formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black,
		formatting.stylua,
		diagnostics.flake8,
	},
})
