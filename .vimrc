" Link for ASCII art: http://patorjk.com/software/taag/#p=display&h=2&v=2&c=bash&f=Big&t=

"    _____  _     _    _  _____ _____ _   _  _____ 
"   |  __ \| |   | |  | |/ ____|_   _| \ | |/ ____|
"   | |__) | |   | |  | | |  __  | | |  \| | (___  
"   |  ___/| |   | |  | | | |_ | | | | . ` |\___ \ 
"   | |    | |___| |__| | |__| |_| |_| |\  |____) |
"   |_|    |______\____/ \_____|_____|_| \_|_____/ 
"                                                  
"plugins

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-latex/vim-latex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

"     _____ ____  _   _ ______ _____ _____ 
"    / ____/ __ \| \ | |  ____|_   _/ ____|
"   | |   | |  | |  \| | |__    | || |  __ 
"   | |   | |  | | . ` |  __|   | || | |_ |
"   | |___| |__| | |\  | |     _| || |__| |
"    \_____\____/|_| \_|_|    |_____\_____|
"                                          
"config

filetype indent plugin on " filetype specific settings
syntax enable 
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start " Backspace works

"" Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Spelling
setlocal spell spelllang=en
syntax spell toplevel

"" Miscellaneous
set hidden
set whichwrap+=<,>,h,l,[,]
set confirm
set mouse=a
set shiftround
set nojoinspaces

"" Copy Paste
set clipboard=unnamed,unnamedplus

"" Shell
set shell=$SHELL

set fileformats=unix,dos,mac

"   __      _______  _____ _    _         _      
"   \ \    / /_   _|/ ____| |  | |  /\   | |     
"    \ \  / /  | | | (___ | |  | | /  \  | |     
"     \ \/ /   | |  \___ \| |  | |/ /\ \ | |     
"      \  /   _| |_ ____) | |__| / ____ \| |____ 
"       \/   |_____|_____/ \____/_/    \_\______|
"                                                
"visual

"" Hybrid line numbers
set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Cursor
set cursorline
set guicursor=

"" Title
set title
set titleold="Terminal"
set titlestring=%F

"" Splits
set splitbelow
set splitright

"" Color
set background=light
colorscheme PaperColor

"" Miscellaneous
set t_Co=255
set ruler
set linebreak
set visualbell
set lazyredraw
set scrolloff=3

"    __  __          _____  _____ _____ _   _  _____  _____ 
"   |  \/  |   /\   |  __ \|  __ \_   _| \ | |/ ____|/ ____|
"   | \  / |  /  \  | |__) | |__) || | |  \| | |  __| (___  
"   | |\/| | / /\ \ |  ___/|  ___/ | | | . ` | | |_ |\___ \ 
"   | |  | |/ ____ \| |    | |    _| |_| |\  | |__| |____) |
"   |_|  |_/_/    \_\_|    |_|   |_____|_| \_|\_____|_____/ 
"                                                           
"mappings

"" Make vim usable
inoremap jk <Esc>

"" Toggle folding easier
nnoremap zz za
vnoremap zz za

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Clear search
nnoremap <silent> <leader><space> :noh<cr>

"" Terminal
nnoremap <silent> <leader>sh :terminal<CR>

"" Better movement
nnoremap j gj
nnoremap k gk
" nnoremap j @='gj'<CR>
" nnoremap k @='gk'<CR>
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

"" In case shift lingers
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Move between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Center result on search
nnoremap n nzzzv
nnoremap N Nzzzv

"    _____  _     _    _  _____ _____ _   _    _____ ____  _   _ ______ _____ _____ 
"   |  __ \| |   | |  | |/ ____|_   _| \ | |  / ____/ __ \| \ | |  ____|_   _/ ____|
"   | |__) | |   | |  | | |  __  | | |  \| | | |   | |  | |  \| | |__    | || |  __ 
"   |  ___/| |   | |  | | | |_ | | | | . ` | | |   | |  | | . ` |  __|   | || | |_ |
"   | |    | |___| |__| | |__| |_| |_| |\  | | |___| |__| | |\  | |     _| || |__| |
"   |_|    |______\____/ \_____|_____|_| \_|  \_____\____/|_| \_|_|    |_____\_____|
"                                                                                   
"plugin config

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close NERDTree if it's the only buffer remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" @TODO figure out what files I want highlighted

" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

map <S-m> :NERDTreeToggle<CR>

"" --- Vim-latex ---
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'

"" Vim-airline
"  @TODO need to fix this still - get it back to old rc file
let g:airline_theme='papercolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

"" Tagbar
nnoremap <Leader>f :TagbarToggle<CR>

"" Vim-closetags
let g:closetag_filetypes = 'html,xhtml,phtml,aspvbs'

"    _               _   _  _____ _    _         _____ ______  _____ 
"   | |        /\   | \ | |/ ____| |  | |  /\   / ____|  ____|/ ____|
"   | |       /  \  |  \| | |  __| |  | | /  \ | |  __| |__  | (___  
"   | |      / /\ \ | . ` | | |_ | |  | |/ /\ \| | |_ |  __|  \___ \ 
"   | |____ / ____ \| |\  | |__| | |__| / ____ \ |__| | |____ ____) |
"   |______/_/    \_\_| \_|\_____|\____/_/    \_\_____|______|_____/ 
"                                                                    
"languages

"" C#
autocmd BufEnter *.ASP :setlocal filetype=aspvbs

"     _____ ____  __  __ __  __          _   _ _____   _____ 
"    / ____/ __ \|  \/  |  \/  |   /\   | \ | |  __ \ / ____|
"   | |   | |  | | \  / | \  / |  /  \  |  \| | |  | | (___  
"   | |   | |  | | |\/| | |\/| | / /\ \ | . ` | |  | |\___ \ 
"   | |___| |__| | |  | | |  | |/ ____ \| |\  | |__| |____) |
"    \_____\____/|_|  |_|_|  |_/_/    \_\_| \_|_____/|_____/ 
"                                                            
"commands                                                            
command! FixWhitespace :%s/\s\+$//e
