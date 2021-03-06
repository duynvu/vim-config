call plug#begin()
" Fuzzy search, Ack
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Vue syntax highlight
Plug 'leafOfTree/vim-vue-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'


Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'liuchengxu/vista.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'

" Ruby
Plug 'tpope/vim-endwise'
Plug 'pearofducks/ansible-vim'

" Check syntax asynchronous
Plug 'w0rp/ale'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Theme
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'

" Visualize Indent Line
Plug 'yggdroot/indentline'

" Status line
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" yarn global add vue-language-server
" Plug 'neoclide/coc-vetur'
" Plug 'neoclide/coc-json'
" Plug 'neoclide/coc-html'
" Plug 'neoclide/coc-css'
" Plug 'neoclide/coc-tsserver'
" Plug 'neoclide/coc-python'
" gem install solargraph
" Plug 'neoclide/coc-solargraph'

Plug 'jidn/vim-dbml'
Plug 'alunny/pegjs-vim'

call plug#end()

set runtimepath+=~/.vim/bundle/vim-dbml

" Use mouse
if has('mouse')
  set mouse=a
endif

set splitright
set splitbelow
set encoding=UTF-8

set termguicolors
let ayucolor="light"
set background=light        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme ayu

" highlight line at cursor
set cursorline

" Tab indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Copy/from to clipboard
set clipboard=unnamedplus
" Show line number
set number
set autoindent
set si

" Auto read/write
set autoread
set autowrite

" When search
set ignorecase
set smartcase
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Files backup
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

" Always show statusline
set laststatus=2

" Turn on WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

let g:vim_vue_plugin_use_sass = 1

"Remap key to split screen
let NERDTreeMapOpenVSplit ='<C-v>'
let NERDTreeMapOpenSplit ='<C-x>'
let NERDTreeMapOpenInTab ='<C-t>'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

if has('nvim')
  " ale
  " Error and warning signs.
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
  let g:ale_linters = {'vue': ['eslint', 'vls']}
  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'vue': ['eslint']
  \}
  " let g:ale_fix_on_save = 1
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  let g:autoformat_remove_trailing_spaces = 0
endif

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'modified', 'filename', 'cocstatus', 'currentfunction' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'filetype', 'fileencoding' ] ],
  \ },
  \ 'component_function': {
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ }
  \ }

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let mapleader = " "
let g:mapleader = " "

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

:imap jj <Esc>
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>sp :split<CR>
nmap <leader>vsp :vsplit<CR>
nmap <leader>t :split<CR> :terminal<CR>
nmap <C-p> :FZF<CR>
nmap <C-n> :tabnew<CR>
map <silent> <leader><CR> :noh<CR>
map <silent> <leader>s :syntax sync fromstart<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
nmap <leader>r :Rg<CR>
nmap <leader>h :History<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Git
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gm :GitMessenger<CR>
let g:git_messenger_always_into_popup = 'true'
let g:git_messenger_include_diff = 'current'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Indent
nnoremap <S-Tab> <<
nnoremap <Tab> >>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Move between panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Mapping for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

syntax on
filetype plugin indent on

" Remap VIM 0 to first non-blank character
map 0 ^

" Support Vue && ES6
autocmd BufReadPost,BufNewFile *.{es6,es6.js} set filetype=javascript
autocmd BufReadPost,BufNewFile *.vue set filetype=vue
autocmd FileType vue syntax sync fromstart
autocmd FileType vue let b:autoformat_autoindent=1

""""""" Set up Rg of FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
