" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
" NOTE: This is causing problems with coc
" Plug 'rstacruz/vim-closer'

function! HandleCRKey() abort
  return pumvisible() ? "\<C-E>\n" : "\n"
endfunction

" vim-closer can extend this correctly
inoremap <silent> <CR> <C-R>=HandleCRKey()<CR>

" Improved motion in Vim
" TODO: Look at this when I've finished cleaning up
" Plug 'easymotion/vim-easymotion'

Plug 'itchyny/lightline.vim'
Plug 'schickling/vim-bufonly'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-scripts/Rename'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'szw/vim-maximizer'

" Easy async RSpec running
Plug 'tpope/vim-dispatch'
Plug 'AdUki/vim-dispatch-neovim'

" Colors
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'KKPMW/sacredforest-vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'


" Finding Stuff
Plug 'ctrlpvim/ctrlp.vim'
if executable('ag')
  Plug 'mileszs/ack.vim'
  let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  Plug 'mileszs/ack.vim'
elseif executable('ack')
  Plug 'mileszs/ack.vim'
endif

Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'


Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'wesQ3/vim-windowswap'

" Intellisense Engine
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Support .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" golang
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'zchee/deoplete-go', { 'do': 'make'}

" nginx
Plug 'chr4/nginx.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 1
Plug 'leshill/vim-json'

Plug 'geekjuice/vim-mocha' 
Plug 'moll/vim-node'

" Testing
" Plug 'janko-m/vim-test'
Plug 'thoughtbot/vim-rspec'
" Plug 'kassio/neoterm'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Lisply Plugins
" Plug 'guns/vim-sexp' " Attempt to strip down?
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'luochen1990/rainbow'
" Clojure plugins
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-clojure-highlight'

" " TODO: Move to completion layer?
" Plug 'clojure-vim/async-clj-omni'
" Plug 'markwoodhall/vim-figwheel'

" Rust
Plug 'rust-lang/rust.vim'

" CSS
Plug 'hail2u/vim-css3-syntax'

Plug 'tpope/vim-markdown'
Plug 'hashivim/vim-terraform'


"" TODO Add these in as we go

"" Tmux/Neovim movement integration
"Plug 'christoomey/vim-tmux-navigator'
"Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'mileszs/ack.vim'

"" Snippet support
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

"" Print function signatures in echo area
"Plug 'Shougo/echodoc.vim'

"" Easily comment/uncomment
"Plug 'tpope/vim-commentary'

"" Easily delete, change and add such surroundings in pairs.
"" Plug 'tpope/vim-surround'

" Easily rename a file
Plug 'vim-scripts/Rename'

"" === Git Plugins === "
"" Enable git changes to be shown in sign column
"" Plug 'mhinz/vim-signify'
"" Plug 'tpope/vim-fugitive'

"" === Javascript Plugins === "
"" Typescript syntax highlighting
"Plug 'HerringtonDarkholme/yats.vim'

"" ReactJS JSX syntax highlighting
"Plug 'mxw/vim-jsx'

"" Generate JSDoc commands based on function signature
"Plug 'heavenshell/vim-jsdoc'

"" Plug 'posva/vim-vue'
"Plug 'leafOfTree/vim-vue-plugin'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

"" Syntax highlighting for javascript libraries
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'vim-syntastic/syntastic'

"" Improved syntax highlighting and indentation
"Plug 'othree/yajs.vim'

" === Ruby Plugins === "
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'janko-m/vim-test'
Plug 'nelstrom/vim-textobj-rubyblock'

"Plug 'kana/vim-textobj-user'
"Plug 'nelstrom/vim-textobj-rubyblock'

"" === Elixir Plugins === "
"Plug 'elixir-editors/vim-elixir'

" === Terraform Plugins === "
Plug 'hashivim/vim-terraform'

"" Python
""Plug 'szymonmaszke/vimpyter'
"Plug 'jupyter-vim/jupyter-vim'

"" === UI === "
"" File explorer
"Plug 'scrooloose/nerdtree'

"" Colorscheme
"Plug 'mhartington/oceanic-next'
"Plug 'KKPMW/sacredforest-vim'
"Plug 'arzg/vim-substrata'

"" Customized vim status line
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"" Icons
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Initialize plugin system
call plug#end()
