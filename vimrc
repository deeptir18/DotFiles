"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'godlygeek/tabular'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'inkarkat/vim-spellcheck'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'lervag/vimtex'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/html5-syntax.vim'
Plug 'mattn/emmet-vim' "html and css
"Plug 'Valloric/YouCompleteMe'
Plug 'rust-lang/rust.vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'kamwitsta/nordisk'
Plug 'cloud-oak/vim-colors-alchemy'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'

"""A lot of this is from frank! thanks frank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call vundle#end()            " required
call plug#end()
syntax enable
filetype plugin indent on    " required
set background=dark
set t_Co=256
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme nord
au BufNewFile,BufRead,BufReadPost *.tex setlocal spell spelllang=en_us
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
"" => c++ settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.pde,*.ino set filetype=c++
"highlighting of class scope
let g:cpp_class_scope_highlight = 1
"highlighting of member variables
let g:cpp_member_variable_highlight = 1
"highlighting of class names in declarations
let g:cpp_class_decl_highlight = 1
" highlight posix functions
let g:cpp_posix_standard = 1
let g:cpp_simple_highlight = 1
let g:coc_disable_startup_warning = 1
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
set tm=80

" Linebreak on 500 characters
set lbr
set tw=80

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

" Make ctrl+backspace delete previous word in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
imap <C-BS> <C-W>


"rustfmt
let g:rustfmt_autosave = 1
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}

set cmdheight=1

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Trigger code actions
nmap <leader>c <Plug>(coc-codeaction-cursor)

" Use K to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Jump to def
nmap <silent> <leader>e <Plug>(coc-diagnostic-info)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>di <Plug>(coc-implementation)

let g:coc_disable_startup_warning = 1
