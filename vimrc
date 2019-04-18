set nocompatible
filetype plugin indent on
syntax enable
set t_Co=256
set fileformats=unix,dos
set smarttab
set expandtab
set shiftround
set shiftwidth=4 softtabstop=4
set list
set number
set listchars=tab:>-,trail:~
set ambiwidth=double
if has('path_extra')
    set tags& tags+=.tags,tags
endif
set laststatus=2
set showtabline=2
set encoding=utf-8
set colorcolumn=80

set clipboard+=unnamed

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('scrooloose/syntastic')
  call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})
  call dein#add('mattn/emmet-vim')
  let g:user_emmet_settings = {
        \  'javascript.jsx' : {
        \      'extends': 'jsx',
        \      'quote_char': "'",
        \   },
        \}

  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('pmsorhaindo/syntastic-local-eslint.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('scrooloose/nerdtree')

  call dein#add('yogomi/Flake8-vim')
  let g:PyFlakeOnQrite = 1
  let g:PyFlakeCheckers = 'pep8m mccabe, pyFlakers'
  let g:PyFlakeDefaultComplexity=10
  let g:PyFlakeCWindow = 9
  let g:PyFlakeSings = 1
  let g:PyFlakeMaxLineLenght = 100
  let g:PyFlakRangeCommand = 'Q'

  call dein#add('thinca/vim-quickrun')
  call dein#add('altercation/vim-colors-solarized')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('vim-scripts/command-t')
  call dein#add('yogomi/vim-cpplint')
  call dein#add('tyru/caw.vim.git')
  call dein#add('myhere/vim-nodejs-complete')

  call dein#add('andviro/flake8-vim')
  call dein#add('cohama/vim-hier')
  call dein#add('dannyob/quickfixstatus')

  let g:PyFlakeOnWrite = 1
  let g:PyFlakeDisableMessages = 'E501,E121,E303,E402'
  let g:PyFlakeSings = 0
  let g:PyFlakeDefaultComplexity = 'Q'
  let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
  let g:PyFlakeDefaultComplexity = 10
  let g:PyFlakeAggressive = 1

  call dein#add('tell-k/vim-autopep8')
  call dein#add('kana/vim-smartchr')
  call dein#add('kana/vim-smartinput')
  call dein#add('davidhalter/jedi-vim')

  nnoremap [Show] <Nop>
  nmap <Space>s [Show]
  nnoremap [Show]hc  :<C-u>HierClear<CR>
  nnoremap [Show]hs  :<C-u>HierStart<CR>
  nnoremap [Show]hp  :<C-u>HierStop<CR>
  nnoremap [Show]hu  :<C-u>HierUpdate<CR>

  nnoremap <M-p>  :<C-u>cp<CR>
  nnoremap <M-n>  :<C-u>cn<CR>


  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



set pastetoggle=<F10>

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-h> <Backspace>
inoremap <C-d> <Del>

cnoremap <C-a> <Home>
cnoremap <C-e> <end>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-h> <Backspace>
cnoremap <C-d> <Del>

nmap ,, <C-Y>,

syntax on

set background=dark

let g:solarozed_termcolors=256

if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
endif

autocmd BufWritePost *.h,*.cpp,*.cc cail Cpplint()
let g:cpplint_cmd_options="--linelength=100 --filter=-readability/streams,-build/c++11"

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

let g:unite_winwidth = 40
nnoremap <C-u> :Unite -vertical file buffer<CR>
nnoremap <C-u><C-o> :Unite -vertical outline<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

nnoremap ; :

set completeopt=menuone

let g:neocomplete#enable_at_startup = 1

let g:neocomplete_enbale_smart_case = 1

let g:neocomplete#max_list = 20

let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sourses#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \}

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()

inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <expr><CR> neocomplete#smart_close_popup() . "\<CR>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"

inoremap <expr><C-y> neocomplete#close_popup()

inoremap <expr><C-e> neocomplete#cancel_popup()

set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set hlsearch

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

nmap <Esc><Esc> :nohlsearch<CR><Esc>
set cursorline

set noswapfile
set nofoldenable

highlight Title term=bold ctermfg=121 gui=bold guifg=#60ff60

if !exists("g:quickrun_config")
  let g:quickrun_config={}
endif
let g:quickrun_config["_"] = {
  \ "outputter/buffer/split" : ":rightbelow 8sp"
  \}

"nnoremap x
set backupdir=~/.vimcache/bak
set viminfo& viminfo+=n~/.vimcache/viminfo
if v:version >= 703
    set undodir=~/.vimcache/undo
    set undofile

  set conceallevel=2 concealcursor=inv
  set colorcolumn=79
endif

nmap <C-Z> <Plug>(caw:i;toggle)
vmap <C-Z> <Plug>(caw:i:toggle)

