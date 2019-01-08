"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'lervag/vimtex'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5-syntax.vim'
Plugin 'mattn/emmet-vim' "html and css
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'kamwitsta/nordisk'
Plugin 'cloud-oak/vim-colors-alchemy'
Plugin 'dracula/vim'

"""A lot of this is from frank! thanks frank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
syntax enable
filetype plugin indent on    " required
set background=dark
set t_Co=16
let g:solarized_termtrans = 1
let g:solarized_termcolors=16
"colorscheme solarized
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline (powerline)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = "powerlineish"
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree (also from frank)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Uncomment to have NERDTree open on vim start
"autocmd vimenter * NERDTree

" Open NERDTree on the left
let g:NERDTreeWinPos = "left"

" Use NERDTree independent of tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Latex settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_latexmk = {'callback' : 0}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
hi Normal guibg=Blue ctermbg=None
highlight nonText ctermbg=None
hi Comment ctermfg=174


set mouse=a
set cursorline
highlight CursorLine guibg=Grey
:hi cursorlinenr ctermfg=red

set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4

let g:go_disable_autoinstall = 0
" Search
set hlsearch
set incsearch

" No sounds! omg this is great
set noerrorbells
set novisualbell
set tm=500

" Linebreak on 500 characters
set lbr
set tw=80

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines



" Highlight
"let g:go_highlight_functions = 1  
"let g:go_highlight_methods = 1  
"let g:go_highlight_structs = 1  
"let g:go_highlight_operators = 1  
"let g:go_highlight_build_constraints = 1  
let g:tex_flavor='latex'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts (also from frank)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigating tabs
nnoremap th  :tabfirst<CR>
nnoremap tn  :tabnext<CR>
nnoremap tN  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tc  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""
" Quickly rebuild pdf while writing tex
"""""""""""""""""""""""""""""""""""""""
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  silent! execute 'wincmd p'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
"command! -nargs=0 Count execute ':Shell pdftotext sop.pdf - | wc -w'
"command! -nargs=0 Build execute ':w' | execute ':silent !make' | execute ':redraw!' | execute ':Count'
command! -nargs=0 Build execute ':w' | execute ':silent !make' | execute ':redraw!'
map <leader>b :Build<cr>
map <leader>r :autocmd BufWritePost * Build

set backspace=2
