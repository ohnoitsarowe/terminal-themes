" Start plugin section
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                  " sane defaults
Plug 'preservim/nerdtree'                  " file explorer
Plug 'vim-airline/vim-airline'             " status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
" Plug 'morhetz/gruvbox'                     " colorscheme
Plug 'Yggdroot/indentLine'                 " indentation guides

call plug#end()
" End plugin section

" Tabs not spaces please
" Indentation settings: always use 4 spaces instead of tab characters
set expandtab       " insert spaces instead of tabs
set shiftwidth=4    " number of spaces used for auto-indent
set tabstop=4       " number of spaces a <Tab> counts for
set softtabstop=4   " number of spaces <Tab>/<BS> uses in insert mode

" Colorscheme setup
syntax on
set background=dark
"colorscheme gruvbox
set termguicolors         " comment this out if your terminal isn't truecolor
colorscheme pipboy
set cursorline            " optional: glowy scanline vibe
highlight CursorLine cterm=NONE ctermbg=236 guibg=#002600

" Airline powerline fonts (optional but looks nice)
let g:airline_powerline_fonts = 1

" NERDTree toggle with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" mouse and clipboard support
set mouse=a
set clipboard=unnamedplus

" force clipboard to copy to system clipboard
nnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy
vnoremap y "+y

nnoremap d "+d
vnoremap d "+d
nnoremap x "+x
vnoremap x "+x

" remap j and k because my brain likes them and heck with conventions lol
nnoremap j k
nnoremap k j

vnoremap j k
vnoremap k j

" Tab confirms the current item when the popup is visible; otherwise inserts a real tab
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" (optional) navigation keys while menu is open
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

" use grip for markdown
let vim_markdown_preview_github=1
