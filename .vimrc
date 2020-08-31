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

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-zoom'
Plug 'yuezk/vim-js', {'for': 'js'}
Plug 'maxmellon/vim-jsx-pretty', {'for': 'jsx'}
Plug 'vim-latex/vim-latex', {'for': 'tex'}
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['cpp', 'hpp']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

call plug#end()

""     _____ ____  _   _ ______ _____ _____ 
""    / ____/ __ \| \ | |  ____|_   _/ ____|
""   | |   | |  | |  \| | |__    | || |  __ 
""   | |   | |  | | . ` |  __|   | || | |_ |
""   | |___| |__| | |\  | |     _| || |__| |
""    \_____\____/|_| \_|_|    |_____\_____|
""                                          
""config

filetype indent plugin on
syntax enable 

set shortmess+=c

"" No Backup
set nobackup
set nowritebackup

"" Less latency
set updatetime=300

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
set tildeop
set hidden "How is this not a default???
set whichwrap+=<,>,h,l,[,]
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

"" More space for displaying messages
set cmdheight=2

"" Invisible chars
set conceallevel=1
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
set cursorline

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
colorscheme gruvbox
set background=dark
" let g:nord_bold_vertical_split_line = 1

"" Miscellaneous
set signcolumn=yes
set ruler
set linebreak
set visualbell
set confirm
set lazyredraw

""    __  __          _____  _____ _____ _   _  _____  _____ 
""   |  \/  |   /\   |  __ \|  __ \_   _| \ | |/ ____|/ ____|
""   | \  / |  /  \  | |__) | |__) || | |  \| | |  __| (___  
""   | |\/| | / /\ \ |  ___/|  ___/ | | | . ` | | |_ |\___ \ 
""   | |  | |/ ____ \| |    | |    _| |_| |\  | |__| |____) |
""   |_|  |_/_/    \_\_|    |_|   |_____|_| \_|\_____|_____/ 
""                                                           
""mappings

"" Fix bd with NERDTree @TODO this still doesnt work, need to find something better
" cnoreabbrev bd bp<bar>sp<bar>bn<bar>bd<CR>

"" Update cwd to that of current file
nnoremap cdc :lcd %:p:h<CR>
nnoremap cdh :lcd ~<CR>

"" Website
" nnoremap <leader>w :term<CR>iweb<CR><C-\><C-n>:bd!<CR> " This is broken

"" Change split size
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"" Make vim usable
inoremap jk <Esc>

"" Tabs
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Clear search
nnoremap <silent> <leader><space> :noh<cr>

"" Terminal
tnoremap jk <C-\><C-n>
nnoremap <leader>sh :call ZshTerminalToggle()<cr>
tnoremap <leader>sh <C-\><C-n>:call ZshTerminalToggle()<cr>
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

"" Source vimrc
nnoremap <leader>ee :source ~/.vimrc<CR>

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

"" vim-go
let g:go_info_mode = 'guru'
let g:go_def_mapping_enabled = 0
let g:go_referrers_mode = 'guru'
let g:go_rename_command = 'guru'
let g:go_play_browser_command = 'google-chrome %URL% &'
let g:go_test_show_name = 1
let g:go_test_timeout= '3s'
let g:go_imports_autosave = 0 " for some reason this makes linting messages dissapear on save
let g:go_fmt_autosave = 0 " for some reason this makes linting messages dissapear on save
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_template_autocreate = 0
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0

"" vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1

"" coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-vimlsp', 'coc-prettier', 'coc-eslint', 'coc-java', 'coc-omnisharp', 'coc-go', 'coc-html', 'coc-python', 'coc-sh', 'coc-texlab', 'coc-clangd', 'coc-css', 'coc-xml', 'coc-cmake', 'coc-yaml', 'coc-phpactor', 'coc-snippets', 'coc-pairs']
"" Use tab to complete
" Use tab to trigger completion and navigate.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl-space to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <CR> to confirm
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"" K to check docs
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

"" vim-zoom
nmap <leader>m <Plug>(zoom-toggle)

"" IndentLine
let g:indentLine_char = "\|"
let g:indentLine_faster = 1
let g:indentLine_concealcursor='inc'
let g:indentLine_first_char = ""
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<C-N>"
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

"" Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <S-m> :NERDTreeToggle<CR>

"" Vim-latex
let g:Tex_AdvancedMath = 1
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_PromptedEnvironments = 'pmatrix,alignat*,gather*,align*,enumerate,itemize,mini*,maxi*'

"" Vim-airline
let g:airline_theme='gruvbox'
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
let g:tex_no_error=1 "Fixes underscores being highlighted

"" C++

"" Python
let g:python_highlight_all = 1

"" C#
autocmd BufEnter *.ASP :setlocal filetype=aspvbs
autocmd BufEnter *.cshtml :setlocal filetype=html

"" C++
" Need to condition this later, fine for now...
set path+=/usr/include/c++/9/

""     _____ ____  __  __ __  __          _   _ _____   _____ 
""    / ____/ __ \|  \/  |  \/  |   /\   | \ | |  __ \ / ____|
""   | |   | |  | | \  / | \  / |  /  \  |  \| | |  | | (___  
""   | |   | |  | | |\/| | |\/| | / /\ \ | . ` | |  | |\___ \ 
""   | |___| |__| | |  | | |  | |/ ____ \| |\  | |__| |____) |
""    \_____\____/|_|  |_|_|  |_/_/    \_\_| \_|_____/|_____/ 
""                                                            
""commands
command! FixWhitespace :%s/\s\+$//e

let g:zsh_terminal_window = -1
ret g:zsh_terminal_job_id = -1

function! ZshTerminalOpen()
  if !bufexists("Terminal 1")
    new zsh_terminal
    wincmd J
    resize 10
    let g:zsh_terminal_job_id = termopen($SHELL, { 'detach': 1 })
    silent file Terminal\ 1
    set nobuflisted
    let g:zsh_terminal_window = win_getid()
  else
    if !win_gotoid(g:zsh_terminal_window)
      sp
      wincmd J
      resize 10
      buffer Terminal\ 1
      let g:zsh_terminal_window = win_getid()
    endif
  endif
  startinsert
endfunction

function! ZshTerminalToggle()
  if expand('%') == "Terminal 1"
    hide
  else
    call ZshTerminalOpen()
  endif
endfunction

command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")

function! Rename(name, bang)
  let l:curfile = expand("%:p")
  let l:curfilepath = expand("%:p:h")
  let l:newname = l:curfilepath . "/" . a:name
  let v:errmsg = ""
  silent! exe "saveas" . a:bang . " " . l:newname
  if v:errmsg =~# '^$\|^E329'
    if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
      silent exe "bwipe! " . l:curfile
      if delete(l:curfile)
        echoerr "Could not delete " . l:curfile
      endif
    endif
  else
    echoerr v:errmsg
  endif
endfunction
