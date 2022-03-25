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

