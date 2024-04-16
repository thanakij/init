syntax on

" https://petermalmgren.com/rc-batch-day-9/
"filetype plugin indent on
"autocmd BufNewFile,BufRead *.rs set filetype=rust

set nu
set hlsearch

set expandtab
set tabstop=2
set shiftwidth=2

set mouse=a
set backspace=indent,eol,start

" https://jameschambers.co.uk/vim-typescript-slow
set re=0

" rustfmt/vim-rust settings
"let g:syntastic_rust_checkers = ['cargo']
"let g:rustfmt_autosave = 1

" https://github.com/dense-analysis/ale/tree/master
" https://github.com/dense-analysis/ale/issues/887
" https://github.com/BeyondCodeBootcamp/vim-ale-hello-world
" https://petermalmgren.com/rc-batch-day-9/
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'go': ['gofmt'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'rust': ['analyzer', 'rustc'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'sh': ['shellcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'go': ['gofmt'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'json': ['prettier'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\   'sh': ['shfmt'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'yaml': ['prettier'],
\}
" https://github.com/dense-analysis/ale/blob/master/doc/ale-javascript.txt
" https://github.com/dense-analysis/ale/blob/master/doc/ale-python.txt
let g:ale_python_isort_options = '--profile black'

" https://blog.ffff.lt/posts/typescript-and-ale/
"let g:ale_sign_error = "🐛"

" https://github.com/dense-analysis/ale/issues/1267
" https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax/
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"hi ALEError ctermbg=lightred ctermfg=red
hi ALEError ctermbg=lightred ctermfg=52
"hi ALEError ctermbg=lightred ctermfg=160

" https://github.com/junegunn/vim-plug, :PlugInstall
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'dense-analysis/ale' " https://github.com/dense-analysis/ale#vim-plug
"Plug 'rust-lang/rust.vim' " https://github.com/rust-lang/rust.vim#vim-plug
"Plug 'vim-syntastic/syntastic' " https://github.com/rust-lang/rust.vim#vim-plug

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
