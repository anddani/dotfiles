set nocompatible
filetype off

" set runtime path and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" include plugins
Plugin 'Lokaltog/vim-powerline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'garbas/vim-snipmate'
Plugin 'klen/python-mode'
Plugin 'lervag/vimtex'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'osyo-manga/vim-over'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'wincent/Command-T'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim'

Plugin 'JamshedVesuna/vim-markdown-preview'

" Lisp
Plugin 'vim-scripts/paredit.vim'
Plugin 'kovisoft/slimv'

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

" End initialization
call vundle#end()
filetype plugin indent on

" Get which os
let os=substitute(system('uname'), "\n", "", "")

" Syntax highlighting
syntax enable
set encoding=utf-8

" List out autocomplete in ex-mode
set wildmenu

" Remap <leader>
let mapleader=","

" gist.vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" python-mode
let g:pymode_rope_completion = 0
let g:pymode_folding = 0

" snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['cpp'] = 'cpp'

" Hotkey to enter .vimrc
nmap <leader>rc :tabnew ~/.vimrc<CR>

" Hotkey to enter snippets
nmap <leader>sn :tabnew ~/.vim/after/snippets<CR>

" Hotkey to source vimrc and install/update packages
nmap <leader>ip :so ~/.vimrc<CR>:PluginInstall<CR>
nmap <leader>up :so ~/.vimrc<CR>:PluginUpdate<CR>

" Quicker search and replace with vim-over
nmap <leader>sr :OverCommandLine<CR>%s/

" Copy to + register
map <leader>y "+y

" Remap multiple cursors
let g:multi_cursor_next_key='<C-o>'
let g:multi_cursor_prev_key='<C-i>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" save with Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Run makefile
nmap <leader>mk :!make<CR>

" highlight search
set incsearch

" Monaco font size 12
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h12
" set guifont=Monaco:h12

" Molokai Color scheme
set t_Co=256
" colorscheme bluer
" colorscheme molokai
set background=dark
colorscheme dracula

" Hybrid line number
set relativenumber
set number

" vertical split for vimdiff
set diffopt+=vertical

" Maps keys to toggle line numbers

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumversOnOff<CR>

" center screen at cursor
nmap <space> zz

" Unmap arrow keys
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Toggle NERDTree with C-t
map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

function! SwitchSourceHeader()
    "update!
    if (expand ("%:e") == "c")
        vert sf %:t:r.h
    else
        vert sf %:t:r.c
    endif
endfunction

nmap <leader>sp :call SwitchSourceHeader()<CR>

" LaTeX-Box
" autocmd FileType tex :nmap <Leader>ll \ll
" nnoremap <Leader>ss :LatexmkStop<CR>
" let g:LatexBox_latexmk_async=0
" let g:LatexBox_split_type="new"
" let g:LatexBox_latexmk_async=1
" let g:LatexBox_viewer = "open -a Skim"
" let g:LatexBox_latexmk_options = '-pvc'
" let g:Latexbox_Folding = 'yes'

" VimTex
" nmap <leader>lmk :VimtexCompileToggle<CR>
nmap <leader>lmk :VimtexCompile<CR>
nmap <leader>le :VimtexError<CR>
nmap <leader>lcl :VimtexStop<CR>:VimtexClean<CR>
nmap <leader>lwc :VimtexCountWords<CR>
let g:vimtex_enabled = 1
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'

" Default to tex (not plaintex)
let g:tex_flavor='latex' 
" let g:vimtex_fold_enabled = 1

" OS specific
if os == "Linux"
    let g:vimtex_view_general_viewer = 'evince' 

    " Paste from clipboard with external command
    map <leader>p :read! xsel --clipboard --output<CR>

    " Open repl in tmux
    let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'

else
    let g:vimtex_view_general_viewer = 'open' 
    let g:vimtex_view_general_options = '-a Skim'
endif

" Toggle tComment
nmap <leader>c <C-_><C-_>

" YouCompleteMe C family auto complete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 1
" Unbind tab YouCompleteMe
let g:ycm_key_list_select_completion = []

" Tab-keys
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>
inoremap <C-n> <Esc>:tabn<CR>
inoremap <C-p> <Esc>:tabp<CR>

" buffer manipulation
noremap gN :bp<CR>
noremap gn :bn<CR>
noremap <leader>d :bd<CR>

" hidden buffer
set hidden

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" STATUS ALWAYS ON
set laststatus=2

" 4-space tab
set tabstop=4
set shiftwidth=4
au Filetype python set textwidth=79
set softtabstop=4
set expandtab
" set nocursorline
set noshowmatch
set splitbelow
set splitright

" POWERLINE
" let g:Powerline_symbols='fancy'

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

" Syntastic
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Backspace
set backspace=2

" set tabspace for ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
