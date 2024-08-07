" Plugins
" https://github.com/junegunn/vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jpalardy/vim-slime'
  Plug 'morhetz/gruvbox' "Theme
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'rking/ag.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-rails'
  Plug 'vim-scripts/BufOnly.vim'
  Plug 'sirver/UltiSnips'
  Plug 'jgdavey/tslime.vim'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tomlion/vim-solidity'
  Plug 'pangloss/vim-javascript'
  Plug 'folke/twilight.nvim'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'tpope/vim-abolish'
  Plug 'mechatroner/rainbow_csv'
  Plug 'hashivim/vim-terraform'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" TODO
" ale
" tslime.vim
" vim-multiple-cursors
" vim-rails
" vim-rspec


call plug#end()

" ------------------

set nocompatible

syntax enable
set number  " line numbers on

" Colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
set termguicolors                       " Enable 24-bit color
set background=dark
colorscheme gruvbox

set wrap
set ruler
set shiftwidth=2
set nofoldenable
set history=500

" Don't highlight search matches
set nohlsearch
" Highlight search matches as you type
set incsearch

set ignorecase
set smartcase

" Enable backspacing over everything
set backspace=indent,eol,start

"Press F2 to paste in text without indenting
set pastetoggle=<F2>

"mouse support in terminal vim
set mouse=a
set ttyfast

set expandtab
set tabstop=2

" Make splits open in sensible directions
set splitbelow
set splitright

" Show git branch in the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let mapleader = " "
"let mapleader = ","
"By default ',' is the complement of ';' (repeat last f{char}). So, use a
"different key for that function.
"noremap [ ,

"Abbreviations
imap  ->
imap  =>

" Instead of moving the cursor up one line, use -
" to set the current word as the search pattern
" WITHOUT moving the cursor. This makes it easier
" to replace this instance and subsequent instances
" of a word.
nmap - #*

"Text bubbling (requires 'unimpaired' plugin)
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" preserve visual selection when indenting/outdenting
vmap > >gv
vmap < <gv

" Refresh NERDTree pane
"
" ensure NrrwRgn doesn't map ,nr
" https://github.com/chrisbra/NrrwRgn/issues/52
let g:nrrw_rgn_nomap_nr = 1

" Better tab completion of vim commands
set wildmenu

" start scrolling 3 lines from top/bottom
set scrolloff=3

"Ignore some files
let NERDTreeIgnore=['\.class$']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

"UltiSnips
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"

"""""
" Leader bindings
"
nmap <leader>nr :NERDTreeFocus<cr> \| R \| <c-w><c-p>
" Zoom the NERDTree pane
nmap <leader>na :NERDTree<cr>A<c-w><c-p>
" Unzoom the NERDTree pane
nmap <leader>nn :NERDTree<cr><c-w><c-p>

"Suppress Syntastic whining (in JS ES6 source code)
map <Leader>st :SyntasticToggleMode<CR>

"NERDTree
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

map <leader>us :UltiSnipsEdit<CR>

"New tab
map <Leader>tn :tabnew<CR>

"Fugitive shortcuts
map <Leader>gs :Git<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gc :Git commit<CR>

map <Leader>gi :!gh issue list<CR>

"tabularize
map <Leader>a: :Tabularize /:\zs<CR>
map <Leader>ac  [ :Tabularize /:\zs<CR>kdd
map <Leader>a, :Tabularize /,\zs<CR>
map <Leader>a= :Tabularize /=<CR>
map <Leader>af :Tabularize /=><CR>
map <Leader>a{ :Tabularize /{<CR>:Tabularize /}<CR>

"tslime mappings
nmap <Leader>gx :Tmux gitx<CR>
nmap <Leader>t :Tmux
nmap <Leader>ct :Tmux ctags -R --exclude=@.ctags_exclude .<CR>
" Use this to (re)set the target tmux session/window/pane for tslime
" commands (i.e. where to run the tests)
nmap <C-c>t <Plug>SetTmuxVars


"write current buffer
nmap <Leader>ww :w<CR>

map <Leader>bo :BufOnly<CR>
map <Leader>bd :bd<CR>

" run ctags
:command! Ctags !touch .ctags_exclude && ctags -R --exclude=@.ctags_exclude .

" Support different cursor in insert mode.
if &term == "screen-256color"
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

"Load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

set dictionary+=/usr/share/dict/words
set thesaurus+=/Users/davidsalgado/Documents/mthesaur.txt
au FileType text setlocal complete+=k

" Autoclose HTML/ERB tags by entering "<" then <ctrl-x><ctrl-o>
au FileType html,eruby setlocal omnifunc=htmlcomplete#CompleteTags

" *.md files are Markdown, not Modula2, but I hate the highlighting,
" so open them without syntax highlighting
" au BufRead,BufNewFile *.md set filetype=

" clean up the sign column for git-gutter
highlight clear SignColumn

" make ctrlp use the git project root as its starting directory
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
  \ 'file': '\.(class)',
  \ 'dir': '^(.bundle|dot-bundle)'
  \ }
let g:ctrlp_max_files = 10000

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ag
" http://robots.thoughtbot.com/faster-grepping-in-vim/
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" bind gp (go pasted) to select previously pasted text
nnoremap gp `[v`]

" edit (e) & source (v) .vimrc
map <Leader>sv :source ~/.vimrc<CR>''
map <Leader>se :e ~/.vimrc<CR>

" use the system clipboard as the default register
" for all yank/cut/put operations
" set clipboard=unnamed

" Copy to/Paste from system clipboard
" Copy line to system clipboard
vmap <Leader>cc "+y
" Copy the whole document to system clipboard
nmap <Leader>ca ggVG"+y
" Insert system clipboard to document
nmap <Leader>cv "+p
" Replace the entire document with the contents of the system clipboard
nmap <Leader>cr ggdG"+p

" Visually select the last yank into this buffer
nmap <Leader>sp '[V']$

" Open README.md in a new tab
nmap <Leader>gr :tab drop README.md<CR>

" source .exrc or .vimrc in current folder, on launch
set exrc
" disable shell and filesystem operations from set exrc
set secure

" Additional mappings for surround.vim
" 103 [g] for #{...}
let g:surround_103 = "#{\r}"

" Put tmp files under .vim/tmp
set undodir=~/.config/nvim/tmp/undo/
set undofile
set backupdir=~/.config/nvim/tmp/backup/
set directory=~/.config/nvim/tmp/swap/

" Treat all numbers as decimal, even if they have leading zeros
set nrformats=

" Syntastic
" let g:syntastic_javascript_checkers = ['jsxhint', 'eslint']
" let g:syntastic_javascript_checkers = ['eslint']

" C++
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" " Ale https://github.com/dense-analysis/ale
" let g:ale_linters = {'ruby': ['standardrb']}
" let g:ale_fixers = {'ruby': ['standardrb']}
" let g:ale_fix_on_save = 1

" vim-go
"let g:go_fmt_autosave = 1
"let g:go_imports_autosave = 1
" Golang stuff
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 " Golang allows four spaces for a tab
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0     " No error if go is not installed


" Enable syntax highlighting of code blocks in markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'python', 'ruby', 'vim']

" Use the python version installed by brew
let g:pythpn3_host_prog = '/Users/david/.pyenv/versions/default/bin/python'

" force vim to rescan the entire buffer when highlighting, but only for
" js/jsx/ts/tsx files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

source ~/.config/nvim/scripts/debug.vim
source ~/.config/nvim/scripts/testrunner.vim
source ~/.config/nvim/scripts/remove_trailing_whitespace.vim
source ~/.config/nvim/scripts/ctrlp.vim
source ~/.config/nvim/scripts/prose.vim
source ~/.config/nvim/scripts/visual_search.vim

" Not sure why these are needed - vim works fine without them
nnoremap <silent> <C-a>h :TmuxNavigateLeft
nnoremap <silent> <C-a>j :TmuxNavigateDown
nnoremap <silent> <C-a>k :TmuxNavigateUp
nnoremap <silent> <C-a>l :TmuxNavigateRight
let g:tmux_navigator_no_mappings = 1

lua << EOF
  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Install typescript language server for CoC
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Show CoC hover tips for word under cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

"Insert mode ctrl key mappings
" a   tmux command prefix
" b   UltiSnips trigger
" c   cancel (same as ESC)
" d
" e
" f
" g   #{
" h   delete
" i   tab
" j   return (same as Ctrl-m ?)
" k   ->
" l   =>
" m   carriage return
" n   go down (in lists)
" o   vim (one normal mode command)
" p   auto-complete
" q
" r   insert from register prefix
" s
" t   $this->
" u   delete to start of line
" v   vim (literal)
" w   delete word backwards
" x   magic insert mode prefix
" y   <%=  %>
" z   bg

