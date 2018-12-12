let mapleader="\<Space>"
let g:mapleader="\<Space>"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'rking/ag.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/grep.vim'
Plugin 'mbriggs/mark.vim'
Plugin 'jwhitley/vim-matchit'
"Plugin 'vim-scripts/TaskList.vim'
"Plugin 'easlee/vim-visualmark'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/LeaderF'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'
"Plugin 'JBakamovic/yaflandia'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'pdavydov108/vim-lsp-cquery'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'skywind3000/vim-preview'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
"Plugin 'lyuts/vim-rtags'

call vundle#end()

syntax on
filetype plugin indent on
set nu
set autoread
set autoindent
set cindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
"set autochdir
set ignorecase smartcase
set nowrapscan
set incsearch
set hlsearch
set noerrorbells
set novisualbell
set t_vb=
set magic
set hidden
set cmdheight=1
set laststatus=2
set backspace=indent,eol,start
set shortmess=atI
set completeopt=longest,menu
set noswf
set nobackup
set writebackup
"set foldenable
"set foldmethod=syntax
"set foldcolumn=0
"setlocal foldlevel=0
"set foldexpr=1
"set background=dark
set t_Co=256
let g:onedark_termcolors=256
autocmd colorscheme * highlight ExtralWhitespace ctermbg=red guibg=red
colorscheme onedark

"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

if has("gui_running")
  set guioptions+=c
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=b
  set showtabline=0
  set cursorline
  set cursorcolumn
  "set guifont=Monaco\ 12
  "set guifontwide=Monaco\ 12
  "set guifont=Source\ Code\ Pro\ 12
  "set guifontwide=Source\ Code\ Pro\ 12
  set gfn=Source\ Code\ Pro\ 14
else
  set cursorcolumn
  set cursorline
endif


if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,a-
    set cscopetag
    set csto=0
    set csverb

  if filereadable("cscope.out")
    cscope add cscope.out
  endif
endif

set tags+=./tags

set grepprg=grep\ -n\ --exclude=cscope*.out\ --exclude=tags\ $*\ /dev/null

map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:!cscope -Rbkq<CR><CR>:cs reset<CR><CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:!cscope -Rbkq<CR><CR>:cs reset<CR><CR>

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\ 

au BufNewFile,BufReadPre *.asm let b:asmsyntax='masm'

set encoding=utf-8
set fileformats=unix,dos
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb2312,gbk,gb18030,big5

"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l
"
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
"Show trailing withespace
au Bufread,BufNewFile *.py,*.pyw,*.c,*.h match ExtralWhitespace /\s\+$/
au InsertEnter *.py,*.pyw,*.c,*.h match ExtralWhitespace /\s\+\%#\@<!$/
au InsertLeave *.py,*.pyw,*.c,*.h match ExtralWhitespace /\s\+$/


"""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_left = 0
let g:tagbar_width = 25
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
"let g:tagbar_iconchars = ['+', '-']
nmap tb :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" BufExplorer
"""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:Tlist_Compact_Format=1
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"""""""""""""""""""""""""
" FileExplorer
"""""""""""""""""""""""""
nmap <silent> <leader>fe :Sexplore<cr>

""""""""""""""""""""""""
" NERD_tree
"""""""""""""""""""""""
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 25
nmap nt :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""
"DoxyGen
""""""""""""""""""""""""""""
"let g:DoxygenToolkit_blockHeader="*****************************************"
"let g:DoxygenToolkit_blockFooter="*****************************************"
let g:DoxygenToolkit_authorName="yanying yinyan2@cisco.com"


"""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
"let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|o)$',
  \ }
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
 "let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""
"session
""""""""""""""""""""""""
let g:session_autosave='no'
let g:session_autoload='no'
"let g:session_directory='./'

""""""""""""""""""""""
" Ag
"""""""""""""""""""""
let g:ag_prg="ag --vimgrep"
let g:ag_highlight=1

""""""""""""""""""""""
" airline
"""""""""""""""""""""
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#whitespace#checks = []

""""""""""""""""""""""""""""""""""""""""""
" LeaderF
""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>t :LeaderfBufTag<Cr>
nnoremap <Leader>a :LeaderfTag<Cr>
nnoremap <Leader>u :LeaderfFunction<Cr>
nnoremap <Leader>s :LeaderfSelf<Cr>
nnoremap <Leader>m :LeaderfMruCwd<Cr>
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_WindowHeight = 0.25
let g:Lf_DefaultExternalTool = "ag"
let g:Lf_UseVersionControlTool=0
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','tags']
        \}
let g:Lf_Ctags = "/usr/bin/ctags"
"let g:Lf_ExternalCommand = 'find "%s" \( -path ./.git \) -prune -o -type f'


""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""
"let g:ycm_server_python_interpreter='/auto/isbu_crdc_sw1/offlinediag/users/yinyan2/local/python2.7.15/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

""""""""""""""""
" clang_completion
"""""""""""""""""
 " path to directory where library can be found
let g:clang_complete_loaded=1
let g:clang_library_path='/auto/isbu_crdc_sw1/offlinediag/users/yinyan2/local/lib'

""""""""""""""""""""
" LSP
""""""""""""""""""""
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/auto/isbu_crdc_sw1/offlinediag/users/yinyan2/local/.cache/cquery' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""
" bookmarks
"""""""""""""""
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'

""""""""""""""""""""
" gutentags
""""""""""""""""""""
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
"let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0

""""""""""""""""""""
" vim-preview
""""""""""""""""""""
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <F4> :PreviewSignature!<cr>
inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>
noremap <c-k> :PreviewScroll -1<cr>
noremap <c-j> :PreviewScroll +1<cr>
inoremap <c-k> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <c-j> <c-\><c-o>:PreviewScroll +1<cr>

""""""""""""""""""""
" jedi
""""""""""""""""""""
let g:jedi#popup_on_dot=0





