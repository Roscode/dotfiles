""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

" COLOR
Plug 'goatslacker/mango.vim'



" Util
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'justinmk/vim-sneak'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'

" javascript
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""

" not really a plugin setting but necessary b4 plugins
let mapleader=","

" ctrlp
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" airline
let g:airline#extensions#tabline#enabled = 2
let g:airline_theme= 'murmur'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout = 1
let g:SuperTabClosePreviewOnPopupClose = 1

" session
let g:session_directory = '~/.config/nvim/session'
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
let g:session_command_aliases = 1
nmap <leader>ss :SaveSession
nmap <leader>so :OpenSession
nmap <leader>sd :DeleteSession
nmap <leader>sc :CloseSession

" nerd tree
nmap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25

" delimitMate
let delimitMate_expand_cr = 1

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = 'eslint'
let g:neomake_jsx_eslint_exe = 'eslint'

" syntaxy stuff
let g:jsx_ext_required = 0


" fugitive
nmap <leader>ge :Gedit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gbl :Gblame<CR>
nmap <leader>gbr :Gbrowse<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""

" color
set background=dark
syntax on
color mango


set whichwrap+=<,>,h,l,[,]
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

if !&scrolloff
  set scrolloff=5       " Show next N lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next N columns while side-scrolling.
endif


" Tell Nvim which charaters to show for expanded TABs,
" trailing whitespace, and end-of-lines. v useful

if &listchars ==# 'eol:$'
  set listchars=tab:>\,trail:-,extends:>,precedes:<nbsp:+
endif
set list " Show the characters ^

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\t/


set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

nnoremap <Leader><Space> :nohl<CR>

" Search and Replace
nmap <Leader>sr :%s//g<Left><Left>


" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

nnoremap ; :
nnoremap Q @q
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
set hidden

