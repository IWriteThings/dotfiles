"""" VUNDLE SETUP
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Managed Plugins
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/LanguageTool'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'rizzatti/dash.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'joonty/vdebug'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/CycleColor'
Plugin 'tobyS/skeletons.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/limelight.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ledger/vim-ledger'
Plugin 'vim-scripts/bats.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax enable
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Adds the wordpress tags to omnicomplete
" Run 'ctags -R . ' in WP directory on each update
" Get ctags if you don't have it
set tags=tags,$HOME/.vim/mytags/framework/wptags
set hlsearch
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
" Move swap files to another directory
set directory=~/.vim/swap
" set clipboard=unnamedplus
" Folding Setup
set nocompatible
let php_folding=1
let javaScript_fold=1
let tex_fold_enabled=1
set foldmethod=syntax
" /Folding Setup
" Omnicomplete
set omnifunc=syntaxcomplete#Complete
" /Omnicomplete
set mouse=a
"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set pastetoggle=<F2>
set backspace=indent,eol,start
" Enable a color column
set colorcolumn=80
" More tabs
set tabpagemax=50
" Syntax highlight
if &t_Co >= 256 || has("gui_running")
	colorscheme vividchalk
	autocmd ColorScheme vividchalk  highlight Search cterm=NONE ctermfg=grey ctermbg=blue
	syntax on
endif
" :WP Command runs this
func! WordProcessorMode() 
  setlocal printoptions=number:y
  setlocal formatoptions+=ta
  setlocal tw=79
  setlocal noexpandtab 
  setlocal spell spelllang=en_us 
  setlocal spellfile=$HOME/.vim/spell/en.utf-8.add
  setlocal noautoindent
  setlocal nosmartindent
  setlocal complete+=s
  setlocal formatprg=par
  setlocal tabstop=5
  nnoremap j gj
  nnoremap k gk
  set ignorecase
endfu 
com! WP call WordProcessorMode()
" Crunch multi line text into single line
function! Crunch() abort
	normal! G
	normal! o
	g/^./ .,/^$/-1 join
endfunction
com! CRUNCH call Crunch()
" Add the language tool
let g:languagetool_jar='~/.vim/LanguageTool/languagetool-commandline.jar'
" Twiddle Case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" vim airline setup
set noshowmode
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_theme='simple'
let g:airline_powerline_fonts=1
" Set powerline fonts for windows under gvim
if has("win32")
	set guifont=Droid_Sans_Mono_for_powerline:h14
endif
" Airline initial setup
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ', 'branch'])
	let g:airline_section_b = airline#section#create([''])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create([' '])
	let g:airline_section_y = airline#section#create([' ','hunks','%f'])
endfunction
autocmd VimEnter * call AirlineInit()
" Add syntax highlighting for Chuck programming language
au BufNewFile,BufRead *.ck setf ck

" Add different coloring to my vim diff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Insert the date and time at the cursor
inoremap <expr> <C-f> strftime('%Y-%m-%dT%H:%M:%S-07:00')

" Auto Create PHP Doc
au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" Find Tags using MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'php' : 1,
\}

" Online Thesaurus Lookup - Key Mapping
let g:online_thesaurus_map_keys = 0
nnoremap <S-t> :OnlineThesaurusCurrentWord<CR>

" GitGutter Settings
let g:gitgutter_max_signs = 1000

" Skeletons
let g:skeletons_dir='~/.vim/bundle/skeletons.vim/skeletons/.'

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Nerdtree
map <C-N> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" YouCompleteMe
" :set ft? to get filetype
let g:ycm_filetype_blacklist = {
      \ 'plaintex' : 1
      \}

" RUBY STUFF
" Change the tab behavior for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Limelight setup
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Autocompile any coffee scripts
autocmd BufWritePost *.coffee silent make!

" Xdebug setup
if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
let g:vdebug_options["break_on_open"]=0
let g:vdebug_options['path_maps'] = {"/var/www/projects/": "/Users/aaron/Applications/developer-vagrant/projects/"}
let g:vdebug_options["debug_file"]='~/.vim/log/vdebug.log'
let g:vdebug_options["debug_file_level"]=2
let g:vdebug_options["ide_key"]='vagrant'

" Syntastic
" Set the default standards for phpcs using the below command
" $ phpcs --config-set default_standard Squiz
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python Development
au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix
let python_highlight_all=1
