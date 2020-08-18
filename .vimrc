"" Link for ASCII art: http://patorjk.com/software/taag/#p=display&h=2&v=2&c=bash&f=Big&t=

""    _____  _     _    _  _____ _____ _   _  _____ 
""   |  __ \| |   | |  | |/ ____|_   _| \ | |/ ____|
""   | |__) | |   | |  | | |  __  | | |  \| | (___  
""   |  ___/| |   | |  | | | |_ | | | | . ` |\___ \ 
""   | |    | |___| |__| | |__| |_| |_| |\  |____) |
""   |_|    |______\____/ \_____|_____|_| \_|_____/ 
""                                                  
""plugins

call plug#begin()

"" File exploration
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-signify'

"" Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'

"" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Tags
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'

"" Commenting
Plug 'tpope/vim-commentary'

"" Fuzzy search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"" Completion/linting
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-zoom'

"" Languages
"" Latex
Plug 'vim-latex/vim-latex'

"" HTML
" Plug 'alvan/vim-clometag'

call plug#end()

""     _____ ____  _   _ ______ _____ _____ 
""    / ____/ __ \| \ | |  ____|_   _/ ____|
""   | |   | |  | |  \| | |__    | || |  __ 
""   | |   | |  | | . ` |  __|   | || | |_ |
""   | |___| |__| | |\  | |     _| || |__| |
""    \_____\____/|_| \_|_|    |_____\_____|
""                                          
""config

set conceallevel=1

filetype indent plugin on
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
" set expandtab

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Spelling
setlocal spell spelllang=en
syntax spell toplevel

"" Miscellaneous
set hidden "How is this not a default???
set whichwrap+=<,>,h,l,[,]
set confirm
set mouse=a
set shiftround
set nojoinspaces "J is cancer

"" Copy Paste
set clipboard=unnamed,unnamedplus

"" Shell
set shell=$SHELL

"" File format
set fileformats=unix

"" Persistent undo
set undodir=~/.vim/undodir//
set undofile

"" Virtual editing in visual mode
set virtualedit+=block

""   __      _______  _____ _    _         _      
""   \ \    / /_   _|/ ____| |  | |  /\   | |     
""    \ \  / /  | | | (___ | |  | | /  \  | |     
""     \ \/ /   | |  \___ \| |  | |/ /\ \ | |     
""      \  /   _| |_ ____) | |__| / ____ \| |____ 
""       \/   |_____|_____/ \____/_/    \_\______|
""                                                
""visual

"" Invisible chars
set list
set listchars=tab:\|\ ,extends:❯,precedes:❮,trail:·
set showbreak=↪
hi NonText ctermfg=244
hi SpecialKey ctermfg=244

"" Hybrid line numbers
set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Cursor
set guicursor=

"" Title
set title
set titleold="Terminal"
set titlestring=%F

"" Splits
set splitbelow
set splitright

"" Color
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
set t_Co=255
set t_ut=
set termguicolors
colorscheme nord
let g:nord_bold_vertical_split_line = 1

"" Miscellaneous
set ruler
set linebreak
set visualbell
set lazyredraw

""    __  __          _____  _____ _____ _   _  _____  _____ 
""   |  \/  |   /\   |  __ \|  __ \_   _| \ | |/ ____|/ ____|
""   | \  / |  /  \  | |__) | |__) || | |  \| | |  __| (___  
""   | |\/| | / /\ \ |  ___/|  ___/ | | | . ` | | |_ |\___ \ 
""   | |  | |/ ____ \| |    | |    _| |_| |\  | |__| |____) |
""   |_|  |_/_/    \_\_|    |_|   |_____|_| \_|\_____|_____/ 
""                                                           
""mappings

"" Change split size
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

"" Make vim usable
inoremap jk <Esc>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Clear search
nnoremap <silent> <leader><space> :noh<cr>

"" Terminal
tnoremap jk <C-\><C-n>
nnoremap <silent> <leader>sh :botright new <bar> resize 10 <bar> term <CR>
augroup Terminal
	au!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

"" Better movement
nnoremap j gj
nnoremap k gk
" nnoremap j @='gj'<CR> "@TODO fix this so multiplied j/k doesn't use gj/gk
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
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap <A-h> <C-w>h

"" Center result on search
nnoremap n nzzzv
nnoremap N Nzzzv

"" Ripgrep
nnoremap <leader>r :Rg<CR>

"" Quick edits
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>eT :e ~/Templates<CR>
nnoremap <leader>etl :e ~/Templates/latex.tex<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>eb :e ~/.bashrc<CR>

"" Folding
nnoremap <space> za
vnoremap <space> za

""    _____  _     _    _  _____ _____ _   _    _____ ____  _   _ ______ _____ _____ 
""   |  __ \| |   | |  | |/ ____|_   _| \ | |  / ____/ __ \| \ | |  ____|_   _/ ____|
""   | |__) | |   | |  | | |  __  | | |  \| | | |   | |  | |  \| | |__    | || |  __ 
""   |  ___/| |   | |  | | | |_ | | | | . ` | | |   | |  | | . ` |  __|   | || | |_ |
""   | |    | |___| |__| | |__| |_| |_| |\  | | |___| |__| | |\  | |     _| || |__| |
""   |_|    |______\____/ \_____|_____|_| \_|  \_____\____/|_| \_|_|    |_____\_____|
""                                                                                   
""plugin config

"" Zoom
nmap <leader>m <Plug>(zoom-toggle)

"" IndentLine
let g:indentLine_char = "\|"
let g:indentLine_faster = 1
let g:indentLine_concealcursor='inc'
let g:indentLine_first_char = "\|"
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:snips_github="RileyJackson2000"
let g:snips_author="Riley Jackson"
let g:snips_email="riley dot jacksonraj at gmail.com"

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 35
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Close NERDTree if it's the only buffer remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('pdf', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('pdf', 'yellow', 'none', 'yellow', '#151515')
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

"" Vim-latex
let g:Tex_AdvancedMath = 1
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_PromptedEnvironments = 'pmatrix,alignat*,gather*,align*,enumerate,itemize,mini*,maxi*'

"" Vim-airline
""  @TODO need to fix this still - get it back to old rc file
let g:airline_theme='nord'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

"" Tagbar
nnoremap <Leader>f :TagbarToggle<CR>

"" fzf.vim

"" Vim-closetags
let g:closetag_filetypes = 'html,xhtml,phtml,aspvbs'

""    _               _   _  _____ _    _         _____ ______  _____ 
""   | |        /\   | \ | |/ ____| |  | |  /\   / ____|  ____|/ ____|
""   | |       /  \  |  \| | |  __| |  | | /  \ | |  __| |__  | (___  
""   | |      / /\ \ | . ` | | |_ | |  | |/ /\ \| | |_ |  __|  \___ \ 
""   | |____ / ____ \| |\  | |__| | |__| / ____ \ |__| | |____ ____) |
""   |______/_/    \_\_| \_|\_____|\____/_/    \_\_____|______|_____/ 
""                                                                    
""languages

"" Latex
let g:tex_conceal=""
let g:tex_no_error=1

"" C++

"" Python

"" C#
autocmd BufEnter *.ASP :setlocal filetype=aspvbs

""     _____ ____  __  __ __  __          _   _ _____   _____ 
""    / ____/ __ \|  \/  |  \/  |   /\   | \ | |  __ \ / ____|
""   | |   | |  | | \  / | \  / |  /  \  |  \| | |  | | (___  
""   | |   | |  | | |\/| | |\/| | / /\ \ | . ` | |  | |\___ \ 
""   | |___| |__| | |  | | |  | |/ ____ \| |\  | |__| |____) |
""    \_____\____/|_|  |_|_|  |_/_/    \_\_| \_|_____/|_____/ 
""                                                            
""commands                                                            
command! FixWhitespace :%s/\s\+$//e
