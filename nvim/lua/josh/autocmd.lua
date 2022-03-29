-- vim.cmd [[set formatoptions-=cro]] -- This does not work
-- see `:verbose set fortmatoptions` to see where fo is being overridden
-- Text behaviour
-- vim.opt.formatoptions:get()
--  + 't'    -- auto-wrap text using textwidth
--  + 'c'    -- auto-wrap comments using textwidth
--  + 'r'    -- auto insert comment leader on pressing enter
--  - 'o'    -- don't insert comment leader on pressing o
--  + 'q'    -- format comments with gq
--  - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--  + 'n'    -- autoformat numbered list
--  - '2'    -- I am a programmer and not a writer
--  + 'j'    -- Join comments smartly

-- Workaround:
vim.cmd([[
	augroup prevent_newline_comment
		autocmd!
		autocmd BufEnter * set formatoptions-=cro
	augroup end
]])

--vim.cmd([[
--augroup format_on_save
--autocmd!
--autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
--augroup end
--]])
