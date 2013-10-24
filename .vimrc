" File: _vimrc             
" Version: 1
" Author: Seth Mason
" Created: 19 Nov 2003 10:20:19

" Added by Håkon Løvdal
"I like using the mouse for selecting in some cases
set mouse=a

" Add solarized theme
set background=dark
colorscheme solarized

"Bind norwegian letters for tab and split movement
nnoremap å :tabnew<cr>
nnoremap ø :tabprev<cr>
nnoremap æ :tabnext<cr>


" Last-modified: 05 Nov 2012 21:49:36
" All my Vim commands for the taking
" Works on cygwin but not very well on unix machines...still trying to figure
" it out

set number

" Use Vim settings, rather then Vi settings (much better!).

set nocompatible

" Turn on the verboseness to see everything vim is doing.
"set verbose=9

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" I like 4 spaces for indenting
set shiftwidth=4

" I like 4 stops
set tabstop=4

" Spaces instead of tabs

set expandtab

" Always  set auto indenting on
set autoindent

" select when using the mouse
set selectmode=mouse


" set the commandheight
set cmdheight=2

" do not keep a backup files 
set nobackup
set nowritebackup
set noswapfile

" Set 52 lines for the display, 1 for the status line.
" and other display options
if has('gui_running')
    " i like about 80 character width lines

  set textwidth=78
  "  2 for the command line
  set lines=52
  " add columns for the Project plugin

  set columns=110
  " enable use of mouse
  set mouse=a
endif

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" show (partial) commands

set showcmd

" do incremental searches (annoying but handy);
set incsearch

" Show  tab characters. Visual Whitespace.
set list

set listchars=tab:>.

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)

set scs

" Set 'g' substitute flag on
" set gdefault

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*


" Always display a status line at the bottom of the window
set laststatus=2

" Set vim to use 'short messages'.
" set shortmess=a

" Insert two spaces after a period with every joining of lines.

" I like this as it makes reading texts easier (for me, at least).
set joinspaces

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" allow tilde (~) to act as an operator -- ~w, etc.

set notildeop


" Java specific stuff
let java_highlight_all=1
let java_highlight_debug=1

let java_ignore_javadoc=1
let java_highlight_functions=1
let java_mark_braces_in_parens_as_errors=1

" highlight strings inside C comments
let c_comment_strings=1

" Commands for :Explore
let g:explVertical=1    " open vertical split winow

let g:explSplitRight=1  " Put new window to the right of the explorer
let g:explStartRight=0  " new windows go to right of explorer window

" for the TOhtml command
let html_use_css=1

if has("gui")

  " set the gui options to:
  "   g: grey inactive menu items
  "   m: display menu bar
  "   r: display scrollbar on right side of window
  "   b: display scrollbar at bottom of window

  "   t: enable tearoff menus on Win32
  "   T: enable toolbar on Win32
  set go=gmr
  set guifont=Courier

endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")

  syntax on
  set hlsearch
endif

" for cygwin
set shell=C:/cygwin/bin/bash

set shellcmdflag=--login\ -c
set shellxquote=\"


" ************************************************************************
" C O M M A N D S

"

"switch to directory of current file
command! CD cd %:p:h

" ************************************************************************
" K E Y   M A P P I N G S

"
map <Leader>e :Explore<cr>
map <Leader>s :Sexplore<cr>

" pressing < or > will let you indent/unident selected lines

vnoremap < <gv
vnoremap > >gv

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.

vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" map ,L mz1G/Last modified:/e<Cr>CYDATETIME<Esc>`z

map ,L    :let @z=TimeStamp()<Cr>"zpa
map ,datetime :let @z=strftime("%d %b %Y %X")<Cr>"zpa

map ,date :let @z=strftime("%d %b %Y")<Cr>"zpa

" Map <c-s> to write current buffer.

map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>


" Select all.
map <c-a> ggVG

" Undo in insert mode.
imap <c-z> <c-o>u

syn on
