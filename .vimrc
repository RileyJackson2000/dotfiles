" Make Vim usable
inoremap jk <Esc>

filetype indent plugin on " filetype specific settings
set tabstop=2 shiftwidth=2 expandtab " No more tabs
set hidden " Edit several buffers at once
set ruler " see mouse position
set whichwrap+=<,>,h,l,[,] " Horizontal movement wraps
set backspace=indent,eol,start " Backspace works
set cursorline " See cursor on status
set confirm " save dialogue on failed save
set visualbell " flash screen on error
set showcmd " show last command in bottom
set wildmenu " autocomplete in command moce
set autoread " update external file changes
set ignorecase " ignore case for search
set smartcase " unless theres capitols
set mouse=a " mouse is usable

" Hybrid line numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Get Vim cursor
set guicursor=

" Toggle folding easier
nnoremap zz za
vnoremap zz za

" Better movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

nnoremap B ^
nnoremap E $

" @TODO set it so that multiplied j and k use gj and gk so that hybrid lines work

" In case shift lingers
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Move between buffers
map <C-n> :bnext<CR>
map <C-p> :bprevious<CR>

" Fix backspace
:set backspace=indent,eol,start

" Spelling
:setlocal spell spelllang=en

call plug#begin()

Plug 'preservim/nerdtree' " Vim file tree
Plug 'NLKNguyen/papercolor-theme' " Papercolor theme
Plug 'vim-latex/vim-latex' " Latex overhaul
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Themes
Plug 'tpope/vim-commentary' " Commenting
Plug 'ludovicchabant/vim-gutentags' " Code tags
Plug 'majutsushi/tagbar' " Browse tags
" @TODO fuzzy search, git, c++, etc..

call plug#end()

" --- NERDTree ---
" Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close NERDTree if it's the only buffer remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" @TODO figure out what files I want highlighted

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

map <S-m> :NERDTreeToggle<CR>

" --- PaperColor ---
" May not be needed
set t_Co=255

set background=light
colorscheme PaperColor

" --- Vim-latex ---
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'

" --- Vim-airline ---
"  @TODO need to fix this still - get it back to old rc file
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" --- Tagbar ---
nnoremap <Leader>f :TagbarToggle<CR>

" --- C# stuff ---
autocmd BufEnter *.ASP :setlocal filetype=aspvbs
