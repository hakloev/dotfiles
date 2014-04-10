"
"File: .vimrc
" Version: 1
" Author: Håkon Løvdal
" Created: 07 Dec 2013

" ========================================================== 
" GENERAL

syntax enable
set background=dark         " Assume a dark background
colorscheme molokai
"let g:molokai_original = 1

if !has('gui')
    set term=$TERM          " Make arrow and other keys work
endif

set shell=/bin/zsh			" Set default shell to zsh 
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

" Select when using the mouse
set selectmode=mouse

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

" Do not keep a backup files 
set nobackup
set nowritebackup
set noswapfile

" Display line numbers
set number

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Turn on the verboseness to see everything vim is doing.
"set verbose=9

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Like every pro I use 4 spaces for indenting
set shiftwidth=4

" I like 4 stops
set tabstop=4

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

" Display the current mode
set showmode                   

" Highlight current line
"set cursorline   

" Show matching brackets/parenthesis  
set showmatch      

" Turn of spell check
set nospell

" ========================================================== 
" STATUSLINE

" Fix the status line:    
" Format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification

set statusline=%<\ %n:%f\ %y%m%r\ [%{strlen(&fenc)?&fenc:&enc}]%=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ (%P)%)

set laststatus=2

" Change highlighting based on mode
if version >= 700
  highlight statusLine cterm=bold ctermfg=black ctermbg=white                   "Initial
  au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=white  "Visual Mode
  au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=grey    "Insert Mode
endif

" ========================================================== 
" COMMANDS

" COMMANDS COMES HERE

" ========================================================== 
" KEY MAPPINGS

" Bind norwegian letters for tab and split movement
nnoremap å :tabnew<cr>
nnoremap ø :tabprev<cr>
nnoremap æ :tabnext<cr>

" Pressing < or > will let you indent/unident selected lines

vnoremap < <gv
vnoremap > >gv
