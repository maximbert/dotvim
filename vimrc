execute pathogen#infect()

colorscheme molokai
set gfn=Menlo\ for\ Powerline:h17

set linespace=3 "Prefer a slightly higher line height

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"* configure how numbers are displayed in tab mode. >
"let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

filetype plugin on

let macvim_skip_cmd_opt_movement = 1

let g:gitgutter_highlight_lines = 1

set noshowmode     " hide the mode below powerline

set showcmd
set foldcolumn=5                  " Add a left margin
set showtabline=0                 " don't show the tab bar

set relativenumber
set number

" enable mouse support in terminal
set mouse=a

"if no extension, assume casual text, and hide line numbers
"au BufNewFile,BufRead * if &ft == ''
"  set nonumber
"else
"  set relativenumber
"  autocmd InsertEnter * :set invnumber "nonumber
"  autocmd InsertLeave * :set number
"endif

" Use h,j,k,l to move around in vim! Don't cheat!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

ino jj <esc>
cno jj <c-c>
"ino hh <esc>
"cno hh <esc>
"ino kk <c-c>
"cno kk <c-c>

set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2                       " spaces per tab
set shiftwidth=2                    " spaces per tab (when shifting)
set softtabstop=2                   " spaces per tab (when editing)
set cinkeys=0{,0},:,0#,!^F
"set cinkeys=0{,0},:,0#,!,!^F,0[
set smartcase     " but become case sensitive if you type uppercase characters

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set scrolloff=9
"set scrolloff=9999     "keep current line in the middle of the screen
set cursorline          "highlight current line :)

" allow movement in Insert mode (with alt+j and alt+k)
imap Ì <Left>
imap ¬ <Right>
imap Ï <Down>
imap È <Up>

"nnoremap j gj
"nnoremap k gk

"moving lines up and down (with alt+j and alt+k)
nnoremap Ï :m .+1<CR>==
nnoremap È :m .-2<CR>==
vmap Ï :m'>+<CR>gv=gv
vmap È :m-2<CR>gv=gv

" rarely used, perhaps to remove/clean up
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi

if has("gui_running")
  "set guioptions=egmrt    "remove toolbar in MacVim
  set guioptions-=T        "remove toolbar in MacVim

  set guioptions-=r        "remove scrollbar in MacVim
  " Disable the scrollbars (NERDTree)
  set guioptions-=L

  "tell the term has 256 colors
  set t_Co=256
endif

" mute any bells!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set showmatch                   " show matching brackets/parenthesis
"set matchtime=5                " blink matching chars for .x seconds

set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search

" hide highlighting (after a searching), and clear the status line
"nnoremap <CR><CR> :noh<CR><CR>:echo ''<CR>      " ENTER is already used
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
"nnoremap <silent> <expr> <CR> Highlighting()

nnoremap <Esc> :noh<CR><Esc>:echo ''<CR>
nnoremap <C-c> :noh<CR><Esc>:echo ''<CR>

set wildmenu
"set wildmode=longest:full,full
set wildmode=list:longest

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/_backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let mapleader="ù"
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <Leader>u :GundoToggle<CR>
"
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" tab navigation like firefox
"nmap <C-S-tab> :tabprevious<CR>
"nmap <C-tab> :tabnext<CR>
"map <C-S-tab> :tabprevious<CR>
"map <C-tab> :tabnext<CR>
"imap <C-S-tab> <Esc>:tabprevious<CR>i
"imap <C-tab> <Esc>:tabnext<CR>i
"nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>

"the following conflicts with Window mode
"map <C-w> <Esc>:tabclose<CR>

" comment line... I wish it could toggle too
map <Bslash><Bslash> :s/^/\/\/<CR><Esc>==
"map ùù :s/\/\//wxw/g<CR><CR>:s/wxw//g<CR><CR>:s/^/\/\//<CR><CR>

"this only works on one line
"map <Bslash><Bslash> I//<Esc>

"map <Bslash>: :s/\/\///<CR><ESC>

" Gedit style mapping
"map <tab> >gv
"map <S-tab> <gv

"nmap <tab> I<space><space><c-c>
"nmap <S-tab> 0xx^

" the following seems to conflict with MacVim...
"map <A-down> ddp
"map <A-up> ddkP

" the following conflicts with Code folding
"map <space> i<space><Esc>
"map <S-space> a<space><Esc>

"imap { {<CR><Tab><CR>}<Esc>k$i
"
"inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
inoremap {}     {}

"imap <tab> <C-P>
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"map <S-Enter> O<Esc>
map <S-Enter> O<Esc>
"nmap <S-CR> a<CR><Esc>
map <c-Enter> i<CR><Esc>

"nmap <CR> i<CR><Esc>
nmap <CR> o<Esc>

"nmap <Space> i<Space><Esc>
nmap <S-Space> a<space><Esc>

" single character insert
nmap <Space> i<space><Esc>l

" this should help with folding single comment line (//)
syn match comment "\v(^\s*//.*\n)+" fold

"map <C-j> 4j
"map <C-k> 4k

"To change two vertically split windows to horizonally split
"Ctrl-W t Ctrl-W K

"Horizontally to vertically:
"Ctrl-W t Ctrl-W H

""nmap // s/^/#
iabbr fun function){<left><left>

"to use, type 'co(', i.e. with the parenthesis)
"iabbr co console.log);<esc>hi
"iabbr co console.log
"iabbr cd console.dir);<left><left>


" turn on syntax highlighting for CoffeeScript (using ~/.vim/syntax/coffee.vim)
if has("syntax")
  syntax on
  filetype on
  au BufNewFile,BufRead *.coffee set filetype=coffee
endif

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" prevent vim from removing indent on commented lines using a # (python, coffeescript)
":inoremap # X^H#
inoremap # x<Esc>r#a
"inoremap # X<BS># " from steve losh's vimrc

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
"vnoremap u <nop>
"vnoremap gu u

" set indent to be 2 caracter long
au FileType coffee setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et

" on French keyboard the backtick ` is a dead key, use the apostrophe instead
nmap ' `

nmap à a
"nmap è `e
"nmap ì `i
"nmap ò `o
"nmap ù `u

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

"My vim statusline is hidden/only appears in split windows!¶
set laststatus=2

let g:Powerline_symbols = 'fancy'

"strip trailling spaces at the end every line of any saved coffeescript file
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.yaml :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

if has("autocmd")
  au BufReadPost *.js retab
endif

" Removes trailing spaces
:function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" when joining lines, trim AND preserve indentation (similar to gJ)
nmap J J:call TrimWhiteSpace()<CR>

nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk

map <c-b> :call JsBeautify()<cr>

highlight! link FoldColumn Normal " Make it the background colour
highlight NonText ctermfg=black  " Match the tildes to your background
highlight NonText guifg=bg " hide tildes... this one works

" highlight all characters past 80 columns
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END

if exists('+colorcolumn')     " Vim v7.3 settings·
  set colorcolumn=80          " Mark ideal text width (set by textwidth)
endif

"nnoremap <silent> <Leader>r :VimroomToggle<CR>:AirlineToggle<CR>
"nnoremap <silent> <Leader>m  :call ToggleVimRoom()<CR>

" hack: Quit after exiting Vimroom
let g:airline_on = 0
function! ToggleVimRoom()
  if g:airline_on
    let g:airline_on = 0
    VimroomToggle            "hide vimroom
    quit
  else
    let g:airline_on = 1
    AirlineToggle             "hide airline
    VimroomToggle
  endif
endfunction

"temp fix for Kinesys Advantage Keyboard
nnoremap > @

" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" persistent undos - undo after you re-open the file
" but this gives warnings under command line vim
" use only in macvim
if v:version > '702'
  set undodir=~/.vim/_undo/
  set undofile
endif


" Ctrl+P
nnoremap <leader>p :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMixed<CR>

let g:ctrlp_working_path_mode = ''

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

map <Leader>n :NERDTreeToggle<CR>

"let g:NERDTreeDirArrows=0
let NERDTreeDirArrows = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
"let NERDTreeShowBookmarks=1      " show bookmarks when NERDTree launches
"au VimEnter * NERDTree /Users/maximbert    " show bookmarks on VIM startup
"autocmd VimEnter * NERDTree UGC
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30

let NERDTreeQuitOnOpen = 1 " close NERDTree after opening a file

"nmap <enter> <enter>:noh<enter>

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set list
set listchars=tab:❱,trail:␣,extends:#,nbsp:␣

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"


if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_working_path_mode = 'r'


" Prevent vim-session from asking us to load the session.
" If you want to load the session, use :SaveSession and :OpenSession
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
let g:session_autosave_periodic = 5
let g:session_directory = "~/.vim/_session/"


" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
"nmap ,w :StripTrailingWhitespaces<CR>


cd /Users/maximbert/Development/panda


let g:yankring_history_file = '.vim/_yankring-history'
nnoremap ,yr :YRShow<CR>
nnoremap C-y :YRShow<CR>

"let g:EasyMotion_do_mapping = 0 " Disable default mappings

"omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
"let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

"map <Leader>h <Plug>(easymotion-linebackward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"one character jump search
nmap <Leader><space> <Plug>(easymotion-s)

"two character jump search
"nmap <Leader><space><space> <Plug>(easymotion-s2)

" single-line search to replace vim's 'f' search
nmap <C-F> <Plug>(easymotion-fl)
nmap <C-F><C-F> <Plug>(easymotion-Fl)

" ommidirection search with n characters
map  ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)

"map  ? <Plug>(easymotion-sn)
"omap ? <Plug>(easymotion-tn)

let g:multi_cursor_quit_key='<C-c>'

nnoremap Q @q
vnoremap Q :norm @q<cr>

python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")

" search in .git/.hg if it exists, else the current working directory.
" " (default is 'ra' which also searches in parent of current file, rarely
" " what you want, especially if you're editing ~/.vimrc or browsing help)
let g:ctrlp_working_path_mode = 'r'

" tell ag to look for the project root, not the current PWD
let g:ag_working_path_mode="r"

noremap <Leader>en :Geeknote<CR>

" let g:tagbar_ctags_bin = '/Users/maximbert/.vim/bundle/ctags-5.8/'

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:gitgutter_eager = 0

let NERDTreeIgnore = ['\.pyc$'] " NERDTree should ignore .pyc files
