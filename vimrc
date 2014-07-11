execute pathogen#infect()

colorscheme molokai
set gfn=Menlo\ for\ Powerline:h17

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

filetype plugin on

let macvim_skip_cmd_opt_movement = 1

let g:gitgutter_highlight_lines = 1

set noshowmode     " hide the mode below powerline

set showcmd
set foldcolumn=5                  " Add a left margin
set showtabline=0                 " don't show the tab bar

set number
set relativenumber

"if no extension, assume casual text, and hide line numbers
"au BufNewFile,BufRead * if &ft == ''
"  set nonumber
"else
"  set relativenumber
"  autocmd InsertEnter * :set invnumber "nonumber
"  autocmd InsertLeave * :set number
"endif

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
"nnoremap <CR> :noh<CR><CR>:echo ''<CR>      " ENTER is already used
nnoremap <Esc> :noh<CR><Esc>:echo ''<CR>

set wildmenu
set wildmode=longest:full,full

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

nnoremap <F6> :GundoToggle<CR>

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

"the following conflicts with Window mode
"map <C-w> <Esc>:tabclose<CR>

" comment line... I wish it could toggle too
map <Bslash><Bslash> :s/^/\/\/<CR><Esc>==
"map ùù :s/\/\//wxw/g<CR><CR>:s/wxw//g<CR><CR>:s/^/\/\//<CR><CR>

"this only works on one line
"map <Bslash><Bslash> I//<Esc>

"map <Bslash>: :s/\/\///<CR><ESC>

" Gedit style mapping
map <tab> >gv
map <S-tab> <gv

nmap <tab> I<space><space><c-c>
nmap <S-tab> 0xx^

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

imap <tab> <C-P>

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

map <C-j> 4j
map <C-k> 4k

"To change two vertically split windows to horizonally split
"Ctrl-W t Ctrl-W K

"Horizontally to vertically:
"Ctrl-W t Ctrl-W H

""nmap // s/^/#
iabbr fun function(){};<esc>hi
"to use, type 'co(', i.e. with the parenthesis)
iabbr co console.log);<esc>hi
"iabbr co console.log


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

" set indent to be 2 caracter long
au FileType coffee setl sw=2 sts=2 et

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

" Removes trailing spaces
:function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

nmap J J:call TrimWhiteSpace()<CR>

nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

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
nnoremap <silent> <Leader>m  :call ToggleVimRoom()<CR>

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

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

" Ctrl+P
nnoremap <leader>p :CtrlPMixed<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

map <F5> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1      " show bookmarks when NERDTree launches
"au VimEnter * NERDTree /Users/maximbert    " show bookmarks on VIM startup
"autocmd VimEnter * NERDTree UGC
