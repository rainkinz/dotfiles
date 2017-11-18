set nocompatible

filetype off

" Use bundles config {
    " Matchit needs to be running for a textobjects
    runtime macros/matchit.vim

    " if filereadable(expand("~/.nvimrc.bundles"))
    "     source ~/.nvimrc.bundles
    " endif

    if filereadable(resolve(expand("~/.nvimrc.plugins")))
        source ~/.nvimrc.plugins
    endif
" }

" General 
set background=dark
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

"    if has('clipboard')
"       if LINUX()   " On Linux use + register for copy-paste
"           set clipboard=unnamedplus
"       else         " On mac and Windows, use * register for copy-paste
"           set clipboard=unnamed
"       endif
"    endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set nospell                         " Spell checking off
    set hidden                          " Allow buffer switching without saving
" }

" Vim UI {

    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=

    set showmode                " display the current mode
    set cursorline              " Highlight current line

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set nohlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {
    set wrap                        " Do wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    "   let g:bjg23_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,css,dockerfile,eruby,java,javacc,javascript,go,python,sh,xml,yml,clojure,markdown,ruby,scss,yaml autocmd BufWritePre <buffer> if !exists('g:bjg23_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    " autocmd FileType go autocmd BufWritePre <buffer> Fmt
    " autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    " autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead .babelrc set filetype=javascript
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript
    autocmd BufNewFile,BufRead Gulpfile set filetype=javascript

    " Workaround vim-commentary for Haskell
    " autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType c,cpp,java,go,ruby,javascript,python,xml,yml setlocal nospell

" }


" Functions {

    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

"}


" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar


        set lines=40                " 40 lines of text instead of 24
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ for\ Powerline\ Regular:h13,Menlo\ Regular:h13,Consolas\ Regular:h13,Courier\ New\ Regular:h14
            "set guifont=Andale\ Mono\ Regular:h13,Menlo\ Regular:h13,Consolas\ Regular:h13,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

    "set guifont=Andale\ Mono\ for\ Powerline\ Regular:h13,Menlo\ Regular:h13,Consolas\ Regular:h13,Courier\ New\ Regular:h14
    " set guifont=Andale\ Mono\ Regular:h13,Menlo\ Regular:h13,Consolas\ Regular:h13,Courier\ New\ Regular:h14
" }


" Key Mappings {

    let mapleader = ','


    " Most prefer to toggle search highlighting rather than clear the current
    " search results. To clear search highlighting rather than toggle it on
    " and off, add the following to your .vimrc.before.local file:
    "   let g:spf13_clear_search_highlight = 1
    if exists('g:spf13_clear_search_highlight')
        nmap <silent> <leader>/ :nohlsearch<CR>
    else
        nmap <silent> <leader>/ :set invhlsearch<CR>
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Easily move through windows
    " TODO: Enable when I've got the basic key bindins down
    " nnoremap <C-h> <C-W>h
    " nnoremap <C-j> <C-W>j
    " nnoremap <C-k> <C-W>k
    " nnoremap <C-l> <C-W>l
" }


" Make navigation easier
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" golang
"
" run :GoBuild or :GoTestCompile based on the go file
" See: https://github.com/fatih/vim-go/blob/master/autoload/go/test.vim
" and
" https://github.com/fatih/vim-go-tutorial#test-it
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    echo "Testing..."

    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'

    echo "Building..."
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" NERDTree cusomization {
  map <leader>n :NERDTreeToggle<CR>
  map <leader>b :NERDTreeFind<CR>
  " autocmd vimenter * NERDTree
  let g:NERDShutUp=1

  " NERDCommenter: Add a space after the comment symbol
  let NERDSpaceDelims=1
" }



if has('nvim')
  set clipboard^=unnamedplus
endif

" Use before config if available {
    if filereadable(expand("~/.nvimrc.local"))
        source ~/.nvimrc.local
    endif
" }
"

" deoplete config
let g:deoplete#enable_at_startup = 1

" match M but not m etc
let g:deoplete#enable_smart_case = 1

" disable autocomplete
let g:deoplete#disable_auto_complete = 1

" From the docs. Though they use TAB
inoremap <silent><expr> <C-Space>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

