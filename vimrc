execute pathogen#infect('bundle/{}', '~/.dotfiles/vim/bundle/{}')

set nocompatible " not vi compatible

syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if has('gui_running')
    colorscheme monokai
    let g:lightline = {'colorscheme': 'monokai'}
elseif &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
    set background=dark
    let g:monokai_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme monokai
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:lightline = {'colorscheme': 'dark'}
    highlight SpellBad cterm=underline
    " patches
    highlight CursorLineNr cterm=NONE
endif

filetype plugin indent on " enable file type detection
" set autoindent
"
" if &diff
    " highlight! link DiffText MatchParen
" endif

"---------------------
" Basic editing config
"---------------------
set shortmess+=I " disable startup message
set nu " number lines
" set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
" set noshowmode " hide mode
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nowrap
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"--------------------
" Misc configurations
"--------------------
"
" Change <Leader> to `
let mapleader = "\\"

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

"---------------------
" Plugin configuration
"---------------------

" UltiSnips
let g:UltiSnipsSnippetsDir= '~/.dotfiles/vim/bundle/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" markdown
" let g:markdown_fenced_languages = [
"     \ 'bash=sh',
"     \ 'c',
"     \ 'coffee',
"     \ 'erb=eruby',
"     \ 'javascript',
"     \ 'json',
"     \ 'perl',
"     \ 'python',
"     \ 'ruby',
"     \ 'yaml',
"     \ 'go',
" \]
" let g:markdown_syntax_conceal = 0

" fugitive
set tags^=.git/tags;~

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
let g:NERDTreeShowHidden = 1

" ALE
" Fix files with prettier, and then ESLint.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter  = 0
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'javascript': ['eslint'],
    \}
let g:ale_fixers = {
    \ 'python': ['yapf'],
    \ 'javascript': ['eslint'],
    \}
nmap <F10> <Plug>(ale_fix)

" YouCompleteMe
" Let clangd fully control code completion
" let g:ycm_clangd_uses_ycmd_caching = 0
" " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = exepath("clangd")


"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

packloadall
silent! helptags ALL
