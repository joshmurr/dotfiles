local options = {
	showmatch = true,
	hlsearch=true,
	incsearch=true,
	tabstop=2,
	softtabstop=2,
	expandtab=true,
	shiftwidth=2,
	smartindent=true,
	autoindent=true,
	wildmode={"longest","list"},
	syntax="enable",
	mouse="a",
	clipboard="unnamedplus",
	cursorline=true,
	ttyfast=true,
	wrap=false,
	termguicolors=true,
	smartcase=true,
	splitright=true,
	splitbelow=true,
	undofile=true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

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

-- vim.cmd [[set formatoptions-=cro]] -- This does not work
-- see `:verbose set fortmatoptions` to see where fo is being overridden
-- Workaround:
vim.cmd [[
	augroup prevent_newline_comment
		autocmd!
		autocmd BufEnter * set formatoptions-=cro
	augroup end
]]
