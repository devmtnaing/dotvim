call pathogen#infect()
set nocompatible			" Don't maintain compatibilityw tih vi
syntax on				" Highlight known syntax
syntax enable

filetype on
filetype plugin on
filetype plugin indent on

" Configuration
" -------------
" let &t_Co=256               " Enable 

if has('gui_running')
    "colorscheme zmrok
    colorscheme molokai
else
    let &t_Co=256
    "colorscheme zenburn
    colorscheme wombat256
endif

set background=dark
set guifont=Inconsolata:h14
set guioptions-=T			" Remove GUI toolbar
set guioptions-=r           " Remove RHS scroll-bar
set guioptions-=L
set visualbell				" Supress audio/visual error ell
set notimeout				" No command timeout
set showcmd			    	" Show typed command prefixes
set ruler

set hlsearch                " Highlight search
set incsearch
set showmatch



set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smarttab
set shiftwidth=4
set textwidth=80
set number
set ignorecase
set smartcase


" set list
" set listchars=trail:¬
set hidden
set splitright
set wildmode=list:longest
set scrolloff=3
set cursorline
set wrap                    " Wrap lines

set autoread
set noswapfile
set nobackup
set nowritebackup

set autowriteall
"autocmd FocusLost * silent! wall

set completeopt=longest,menuone,preview

" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Stop using the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" kj - get out of insert mode
imap kj         <Esc>

" Make Y consistent with D and C
map Y           y$

" Indent/unindent visual mode selection
vmap <tab>      >gv
vmap <S-tab>    <gv

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Remove highlighting post-search
nmap <leader>y  :nohls<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G``    :delmarks z<CR>:echo "Reformatted."<CR>

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>

" Easy access to the shell
map <Leader><Leader> :!

" Insert a blank link without leaving insert mode
:nnoremap <silent> <leader>k :pu! _<cr>:']+1<cr>   " on top
:nnoremap <silent> <leader>j :pu _<cr>:'[-1<cr>    " at the bottom


" MarkDown
" ---------
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

" Rainbow Parentheses
" -------------------
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" NERDTree & NERDCommenter
" --------
nmap ,nt :NERDTree
nmap ,nc :NERDTreeToggle
let NERDTreeShowHidden=1

" Use arrow characters instead of old +~
let NERDTreeDirArrows=1

" Use Minimal UI
"let NERDTreeMinimalUI=1

" Showing current file
map \|      :NERDTreeFind<CR>

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\pyc$', 'pip-log\.txt$']

" Automatically change current directory to that of the file in the buffer
"autocmd BufEnter * cd %:p:h

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle

" T comment
" map <leader>/ <c-_><c-_>

" Small default width for NERDTree pane
let g:NERDTreeWinSize = 30


" Whitespace & highlighting & language-specific config
" ----------------------------------------------------

" Strip trailing whitespace for code files on save
" C family
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e

" Ruby, Rails
autocmd BufWritePre *.rb,*.yml,*.js,*.json,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml,*.feature :%s/\s\+$//e
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile soloistrc set filetype=ruby

" Java, PHP
autocmd BufWritePre *.java,*.php :%s/\s\+$//e

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Highlight Jasmine fixture files as HTML
autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

" Consider question/exclamation marks to be part of a Vim word.
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

" Insert ' => '
autocmd FileType ruby imap  <Space>=><Space>

" Python, Django
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Autocomplete
" ------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Key combo to toggle omni complete
inoremap <leader>a <C-x><C-o>

" So that the completation doesn't select the first item
set completeopt=longest,menuone

" SuperTab
" --------
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

" .vimrc
" ------
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Shortcut to edit .vimrc file
nmap ,rc :tabedit $MYVIMRC


" Django-specific
let g:last_relative_dir = ''
nnoremap <leader>1 :call RelatedFile ("models.py")<cr>
nnoremap <leader>2 :call RelatedFile ("views.py")<cr>
nnoremap <leader>3 :call RelatedFile ("urls.py")<cr>
nnoremap <leader>4 :call RelatedFile ("admin.py")<cr>
nnoremap <leader>5 :call RelatedFile ("tests.py")<cr>
nnoremap <leader>6 :call RelatedFile ( "templates/" )<cr>
nnoremap <leader>7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap <leader>8 :call RelatedFile ( "management/" )<cr>
nnoremap <leader>0 :e settings.py<cr>
nnoremap <leader>9 :e urls.py<cr>

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

" Virtualenv
" ----------

" Add virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Launching External Apps
" -----------------------
abbrev ff :! open -a firefox.app %:p<cr>
abbrev chrome :! open -a google\ chrome\ canary.app %:p<cr>
abbrev sf :! open -a safari.app %:p<cr>

" Zen-Coding
" ----------

" Change zen-coding plugin expansion key to Ctrl-E
"let g:user_zen_expandabbr_key = '<C-e>'

" Change zen-coding leader key for expanding or balance tag or for all
"let g:user_zen_leader_key = '<C-y>'

" Conque-Shell
" ------------

" Start a Shell in the Horizontal Split
nmap <leader>cs :ConqueTermSplit bash<cr>
nmap <leader>vcs :ConqueTermVSplit bash<cr>


" Pydiction
" ---------
" let g:pydiction_location = '/Users/emoosx/.vim/bundle/pydiction/complete-dict'

" Command-T
map <leader>t :CommandT<cr>
map <leader>T :CommandTFlush<cr>

" Tagbar
" ------
map <leader>l :TagbarToggle<cr>

" Solarized Color Scheme
" ----------------------
let g:solarized_contrast="့့့့့high"
let g:solarized_visibility="high"


" Path to Ctags
" ------------
let g:Tlist_Ctags_Cmd='/opt/local/bin/ctags'

" Processing
" -----------

let g:processing_doc_style="web"

" TwitVim
" -------

let twitvim_login = "emoosx:3m0tux"
let twitvim_enable_python = 1

" Send direct message
map <leader>dm :SendDMTwitter

" Post tweet
map <leader>tw :PosttoTwitter<cr>


" Swapping Split Screens
" ----------------------

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


" Make sure Vim returns to the same line when you reopen a file
" -------------------------------------------------------------
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz"' |
        \ endif
augroup END    

" Indent Guides
" -------------

let g:indentguides_state = 0
function! IndentGuides()
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
nnoremap <leader>i :call IndentGuides()<cr>

" Block Colors
" ------------
let g:blockcolor_state = 0
function! BlockColor()
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77880)
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
    else
        let g:blockcolor_state = 1
        call matchdelete("BlockColor1", '^ \{4}.*', 1, 77880)
        call matchdelete("BlockColor2", '^ \{8}.*', 2, 77881)
        call matchdelete("BlockColor3", '^ \{12}.*', 3, 77882)
        call matchdelete("BlockColor4", '^ \{16}.*', 4, 77883)
    endif
endfunction
nnoremap <leader>B :call BlockColor()<cr>

" Ctags
" -----
nnoremap <leader><cr> :silent !/opt/local/bin/ctags -R . && sed -i .bak -E -e '/^[^	]+	[^	]+.py	.+v$/d' tags<cr>



