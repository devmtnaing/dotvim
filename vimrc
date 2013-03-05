" vimrc
" Author: Kaung Htet Zaw <emoosx@gmail.com>
" Source: http://github.com/emoosx/dotvim

set nocompatible
filetype off
" Bundles installed {{{
  " Vundle {{{
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
    Bundle 'gmairk/vundle'
      let g:vundle_default_git_proto = 'git'
  " }}}
  " Coding {{{
      Bundle 'ervandew/supertab'
      Bundle 'ervandew/supertab'
      Bundle 'sjl/gundo.vim'
      Bundle 'msanders/snipmate.vim'
      Bundle 'Raimondi/delimitMate'
      Bundle 'scrooloose/nerdcommenter'
      Bundle 'scrooloose/syntastic'
      Bundle 'scrooloose/nerdtree'
      if executable('ctags')
        Bundle 'majutsushi/tagbar'
      endif
  " }}}
  " python {{{
      Bundle 'kien/ctrlp.vim'
      Bundle 'davidhalter/jedi-vim'
      Bundle 'pfdevilliers/Pretty-Vim-Python'
      Bundle 'jmcantrell/vim-virtualenv'
      Bundle 'klen/python-mode'
  " }}}
  " LaTeX {{{
      Bundle 'jcf/vim-latex'
  " }}}
  " python {{{
      Bundle 'othree/html5.vim'
  " }}}
  " css, less {{{
      Bundle 'skammer/vim-css-color'
      Bundle 'groenewege/vim-less'
      Bundle 'mattn/zencoding-vim'
      Bundle 'hail2u/vim-css3-syntax'
  " }}}
  " js {{{
      Bundle 'juvenn/mustache.vim'
      Bundle 'kchmck/vim-coffee-script'
      Bundle 'othree/javascript-libraries-syntax.vim'
  " }}}
  " git {{{
      Bundle 'tpope/vim-fugitive'
  " }}}
  " Utilities {{{
      Bundle 'tpope/vim-repeat'
      Bundle 'YankRing.vim'
      Bundle 'bufexplorer.zip'
  " }}}
  " markdown {{{
      Bundle 'tpope/vim-markdown'
      Bundle 'suan/vim-instant-markdown'
  " }}}
  " colorschemes {{{
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Lokaltog/vim-distinguished'
    Bundle 'sjl/badwolf'
    Bundle 'chriskempson/tomorrow-theme'
    Bundle 'w0ng/vim-hybrid'
    Bundle 'zaiste/Atom'
    Bundle 'tomasr/molokai'
    Bundle 'tpope/vim-vividchalk'
    Bundle 'jellybeans.vim'
    Bundle 'Sift'
    Bundle 'blackboard.vim'
    Bundle 'wombat256.vim'
    Bundle 'sexy-railscasts'
    Bundle 'Mustang2'
    Bundle 'xterm16.vim'
  " }}}
  " Fancy {{{
      Bundle 'uguu-org/vim-matrix-screensaver'
      Bundle 'Lokaltog/vim-powerline'
      Bundle 'kien/rainbow_parentheses.vim'
      Bundle 'nathanaelkane/vim-indent-guides'
  " }}}
  " Others {{{
    Bundle 'tpope/vim-eunuch'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'Spaceghost/vim-matchit'

    Bundle 'peterhoeg/vim-tmux'
    Bundle 'zaiste/tmux.vim'
    Bundle 'benmills/vimux'
    Bundle 'slim-template/vim-slim'
    Bundle 'vim-scripts/scratch.vim'
  " }}}
" }}}
filetype plugin indent on
" Leader {{{
  let mapleader = ","
  let maplocalleader = "\\"
" }}}
" Configs {{{
  set nocompatible 			" leave vi-compatibility mode
  set encoding=utf-8 			" unicode encoding by default
  set title                   " show title in terminal
  set ttyfast
  set hidden                  " buffer hidden, not closed, when abandoned
  set noexrc
  set gdefault        " Global searching as default
  set modelines=0
  set linebreak
  set synmaxcol=800
  set showcmd
  set nostartofline
  set history=1000
  set visualbell                      " supress audio/visual error
  set cursorcolumn
  set backspace=indent,eol,start
  set relativenumber
  set lazyredraw
  set hlsearch
  set autowrite
  set autoread
  set shiftround
  set incsearch
  set showmatch
  set cursorline
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  set laststatus=2
  set report=0
  set ruler               " always show current positions along the bottom
  set list
  set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
  set showbreak=↪
  set updatetime=4000
  set complete=.,w,b,u,t
  set completeopt=longest,menuone,preview

" }}}
" Folding {{{
  set foldlevelstart=0
  nnoremap <Space> za
  vnoremap <Space> za
  " Make z0 recursively open whatever top level fold we're in
  nnoremap z0 zCz0 
  " Use ,z to "focus" the current fold
  nnoremap <leader>z zMzvzz
" }}}
" Case {{{
  set ignorecase
  set smartcase
" }}}
" Splits {{{
  set splitright
  "set splitbelow

" }}}
" Tabs, spaces, wrapping {{{
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set wrap
  set wm=4
  set formatoptions=qrn1
  set textwidth=80
  set smarttab
  set autoindent
  set smartindent
" }}}
" Backups {{{

set noswapfile
set nobackup
set nowritebackup
set autowriteall

" }}}
" Triggers {{{
au FocusLost * :wa " auto save when losing focus
au VimResized * :wincmd = " resize splits when the window is resized
" }}}
" Wildmenu {{{

"set wildchar=<Tab>
set wildmode=longest:full:list
set wildignore+=*.o,*.pyc,.DS_Store
set wildignore+=*.orig
set wildignore+=*.javac,*.aux,*.out,*.toc
set wildignore+=*.sw?,*.exe,*.dll,*.manifest
set wildignore+=migrations
set wildignore+=*.jpg,*.bmp,*.jpeg,*.gif,*.png

" }}}
" Navigation {{{
  " Tabs {{{
    nmap <C-l> gt
    nmap <C-h> gT
    nmap gl <C-w>l

    " QQ - quit tab
    nnoremap QQ :QuitTab<cr>
    command! QuitTab call s:QuitTab()
    function! s:QuitTab()
        try
            tabclose
        catch /E784/    " can't close last tab
            qall
        endtry
    endfunction
  " }}}
  " Splits {{{
    nmap gh <C-w>h
    nmap gk <C-w>k
    nmap gj <C-w>j
  " }}}
" }}}
" Plugin settings {{{
  " SuperTab {{{
    let g:SuperTabDefaultCompletionType = "context"
  " }}}
  " Gundo {{{
    nnoremap <F5> :GundoToggle<cr>
  " }}}
  " NERDCommenter {{{
    map <leader>/ <plug>NERDCommenterToggle
  " }}}
  " Syntastic {{{
    nnoremap <leader>e :Errors<cr>
    let g:syntastic_check_on_open = 0
    let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list =0
  " }}}
  " NERDTree {{{
    nmap <leader>nt :NERDTree
    nmap <F2> :NERDTreeToggle<cr>
    let g:NERDTreeHighlightCursorline=1
    let g:NERDTreeWinSize=30
    let g:NERDTreeIgnore=['\~$', '.*\pyc$', '.class[[file]]', 'pip-log\.txt$', '.DS_Store']
    let g:NERDTreeShowHidden=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeMinimalUI=1
    let g:NERDChristmasTree=1
    let g:NERDTreeChDirMode=2
    let g:NERDTreeMapJumpFirstChild = 'gK'
    map <leader>\ :NERDTreeFind<cr>
    " change the current dir to that of the opening file
    autocmd bufenter * cd %:p:h
  " }}}
  " CtrlP {{{
        map <leader>p :CtrlP<cr>
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
            \ 'file': '\.exe$\|\.so$\|\.javac$\|\.pyc$'
            \ }

    " }}}
  " Tagbar {{{
          nnoremap <silent> <leader>l :TagbarToggle<cr>
          let g:tagbar_foldlevel = 2
          let g:tagbar_width = 30
    " }}}
  " Python-Mode {{{
        let g:virtualenv_stl_format = '[%n]'
        " :VirtualEnvDeactivate
        " :VirtualEnvList
        " :VirtualEnvActivate spam
        " :VirtualEnvActivate <tab>
      
        let g:ropevim_enable_shortcuts = 1
        let g:pymode_rope_goto_def_newwin = "vnew"
        let g:pymode_breakpoint = 1
        let g:pymode_syntax = 1
        let g:pymode_syntax_builtin_objs = 1
        let g:pymode_syntax_builtin_funcs = 1
        let g:pymode_rope = 0
        let g:pymode_rope_extended_complete = 1
        let g:pymode_lint_write = 0
        let g:pymode_run_key = 'R'
        let g:pymode_lint = 1
        let g:pymode_indent = 1
        let g:pymode_rope_vim_completion = 1
        let g:pymode_rope_always_show_complete_menu = 1
        let g:pymode_syntax_print_as_function = 1
    " }}}
  " Solarized {{{
      let g:solarized_menu = 1
      if has('gui_running')
          call togglebg#map("<F6>")
      endif
  " }}}
  " Powerline {{{
    let g:Powerline_symbols = 'fancy'
    nnoremap <leader>R :RainbowParenthesesToggle<cr>
  " }}}
" }}}
  " Filetype-specific {{{
    " Python {{{
    " }}}
    " Django {{{
      augroup ft_django
        au!
        au FileType htmldjango setl ts=2 sts=2 sw=2
      augroup END
    " }}}
    " html {{{
      augroup ft_html
        au!
        au FileType html setl ts=2 sts=2 sw=2 syn=htmldjango
      augroup END
    " }}}
    " Css, Less {{{
      augroup ft_css
        au!
        au FileType css setl ts=2 sw=2 sts=2
        au FileType less setl ts=2 sw=2 sts=2
        au FileType *.less setl ts=2 sw=2 sts=2
      augroup END
    " }}}
    " Js {{{
      augroup ft_js
      augroup END
    " }}}
    " php {{{
      augroup ft_php
        au!
        au FileType php setl ts=2 sts=2 sw=2
      augroup END
    " }}}
    " vim {{{
      augroup ft_vim
        au!
        au FileType vim setl foldmethod=marker ts=2 sts=2 sw=2
      augroup END
    " }}}
    " markdown {{{
      augroup ft_markdown
        au!
        au FileType markdown setl ts=2 sts=2 sw=2
        au FileType markdown setlocal nowrap
      augroup END
    " }}}
    " ruby {{{
      augroup ft_ruby
        au!
        au BufRead,BufNewFile Vagrantfile set filetype=ruby
      augroup END
    " }}}
    " json {{{
      augroup ft_json
        au!
        autocmd BufRead,BufNewFile *.json set ft=javascript
      augroup END
    " }}}
  " }}}
" Environment (GUI/Console) {{{
syntax on
if has('gui_running')
    set background=dark
    colorscheme badwolf
    set colorcolumn=85
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
    if has('gui_macvim')
        "set guifont=Inconsolata-dz\ for\ Powerline:h14
        set guifont=Inconsolata:h16
        "set guifont=CPMono_v07:h16
        set transparency=6
        "set fullscreen
        set fuopt+=maxhorz
        set fuopt+=maxvert
        macmenu &Edit.Find.Find\.\.\. key=<nop>
        map <D-f> :set invfu<cr>
    elseif has('gui_gtk')
        set guifont=Monospace\ 11
    elseif has('gui_win32')
        echo ":("
    endif
    set guioptions-=L
    set linespace=1
    set guioptions-=M
    set guioptions-=r
    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    set t_Co=256
    color wombat256mod
endif
" }}}
" Utlitiy Functions {{{

    " Relative Number {{{
    function! g:ToggleRelativeNumber()
        if &relativenumber
            setlocal number
        else
            setlocal relativenumber
        endif
    endfunction
    nnoremap <silent> <f1> :call g:ToggleRelativeNumber()<cr>
    " }}}
  " Show syntax highlighting groups for word under cursor {{{
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
    nmap <C-s> :call <SID>SynStack()<cr>
  " }}}
  " Transparency {{{
    nnoremap <C-)> :set transp+=10<cr>:set transp<cr>
    nnoremap <C-(> :set transp-=10<cr>:set transp<cr>
  " }}}
  " Toggle Indicators {{{
  " We'll use &number and &relativenumber (mutually eclusive) as proxies for 
  " the toggle state of all our preferred indicator UI
  function! ToggleIndicators()
      if (&number || &relativenumber) " turn off indicators
          let b:IndicatorNumber = 0
          let b:IndicatorRelativeNumber = 0
          let b:IndicatorCursorColumn = 0
          let b:IndicatorCursorLine = 0
          let b:IndicatorColorColumn = 0
          let b:IndicatorLastStatus = 0
          if &number
              let b:IndicatorNumber = 1
              set nonumber
          else " must be relativenumber
              let b:IndicatorRelativeNumber = 1
              set norelativenumber
          endif
          if &cursorcolumn==1
              let b:IndicatorCursorColumn = 1
              set nocursorcolumn
          endif
          if &cursorline
              let b:IndicatorCursorLine = 1
              set nocursorline
          endif
          if &colorcolumn > 0
              let b:IndicatorColorColumn = &colorcolumn
              set colorcolumn=0
          endif
          if &laststatus > 0
              let b:IndicatorLastStatus = &laststatus
              set laststatus=0
          endif
      else                            " turn on indicators
          if b:IndicatorNumber
              set number
          else " must be relativenumber
              set relativenumber
          endif
          if b:IndicatorCursorColumn
              set cursorcolumn
          endif
          if b:IndicatorCursorLine
              set cursorline
          endif
          if b:IndicatorColorColumn > 0
              exe "set colorcolumn=" . b:IndicatorColorColumn
          endif
          if b:IndicatorLastStatus > 0
              exe "set laststatus=" . b:IndicatorLastStatus
          endif
      endif
  endfunction
  nnoremap <F3> :call ToggleIndicators()<cr>
  inoremap <F3> <esc>:call ToggleIndicators()<cr>
  vnoremap <F3> <esc>:call ToggleIndicators()<cr>
  " }}}
  " Swapping Split Screens {{{

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

  nnoremap <silent> <leader>mw :call MarkWindowSwap()<cr>
  nnoremap <silent> <leader>pw :call DoWindowSwap()<cr>
  " }}}
  " Auto saving VIMRC {{{
  source ~/.vim/setcolors.vim
  augroup vimrcs
      au!
      au bufwritepost ~/.vimrc
      \ source ~/.vimrc |
      \ source ~/.vim/setcolors.vim |
      \ if exists('g:Powerline_loaded') |
      \ silent! call Pl#Load()
      \ endif
  augroup END
  " }}}
  " Make sure Vim returns to the same line when you reopen a file {{{
  augroup line_return
      au!
      au BufReadPost *
                  \ if line("'\"") > 0 && line("'\"") <= line("$") |
                  \   execute 'normal! g`"zvzz"' |
                  \ endif
  augroup END    
  " }}}
" Convenience Mappings {{{
  " Toggle CursorColumn  {{{
  nnoremap <F4> :set invcursorcolumn<cr>
  inoremap <F4> <esc>:set invcursorcolumn<cr>a
  vnoremap <F4> <esc>:set invcursorcolumn<cr>
  " }}}
" }}}
  " Quick editing {{{
    nnoremap <leader>rc :vsp $MYVIMRC<cr>
    nnoremap <leader>grc :vsp $MYGVIMRC<cr>
    nnoremap <leader>zsh :vsp ~/.zshrc<cr>
  " }}}
  " Search {{{
    nmap <leader>s  :%s/
    vmap <leader>s  :%s/
    nnoremap / /\v
    vnoremap / /\v
    nnoremap <leader>y  :nohls<cr>
  " }}}

  " Previous/next buffers
  map <M-D-Left>  :bp<cr>
  map <M-D-Right> :bn<cr>

  " Fast scrolling
  nnoremap <C-e>  3<C-e>
  nnoremap <C-y>  3<C-y>
  nmap J 5j
  nmap K 5k
  xmap J 5j
  xmap K 5k

  " Search

  " easier moving of code blocks
  vnoremap < <gv
  vnoremap > >gv

  " Make Y consistent with D and C
  map Y           y$


  nnoremap ; :

  imap kj <esc>
  imap jj <esc>

  " sorting functions
  vnoremap <leader>S :sort<cr>
  " toggle spell-checking
  map <f7> :setlocal spell!<cr>


  " Stop using the arrow keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

  nnoremap j gj
  nnoremap k gk
  xnoremap j gj
  xnoremap k gk

  " Change case
  nnoremap <C-o> gUiw
  nnoremap <C-i> gUiwea

  " Send visual selection to gist.github.com as a private filetyped Gist
  " Requires the gist command line tool ( brew install gist )
  " thanks Steve Losh!
  vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
  vnoremap <leader>UG :w !gist -p \| pbcopy<cr>
" }}}


