local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Error loading Null-LS")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local function has_eslint_configured(utils)
	local c = utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
	local status = "ESLint config " .. (c and "found!" or "not found :(")
	vim.notify(status)
	return c
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr }) -- NVIM 0.8.0
				end,
			})
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
			condition = function()
				return #null_ls.get_source({ name = "eslint_d", method = null_ls.methods.FORMATTING }) == 0
			end,
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		--formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black,
		formatting.stylua,
		diagnostics.flake8,
	},
})
