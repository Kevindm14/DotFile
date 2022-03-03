syntax on
set number
set encoding=utf-8
set termguicolors 
set tabstop=2
set expandtab
set smarttab
set autoindent
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set ignorecase
set smartcase

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')
  Plug 'rktjmp/lush.nvim'

  " themes
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'phanviet/vim-monokai-pro'

	Plug 'Yggdroot/indentLine'
	Plug 'mattn/emmet-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
  Plug 'psliwka/vim-smoothie'
	Plug 'preservim/nerdtree'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jiangmiao/auto-pairs'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'romgrk/barbar.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Give more space for displaying messages.
set cmdheight=2

" delays and poor user experience.
set updatetime=300

" Themes
set background=dark " or light if you want light mode
colorscheme monokai_pro 

" Show Hidden Files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', 'tmp', '\.git', '\.bundle', '.DS_Store', 'tags', '.swp']
let g:NERDTreeDirArrows=0
nnoremap <C-n> :NERDTreeToggle<CR>

" Search in Files
nnoremap <C-p> :Files<Cr>
let g:fzf_layout = { 'down': '40%' }

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Config for the Vim-AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Config for the IndentLines
"let g:indentLine_setColors = 0
"let g:indentLine_color_gui = '#A4E57E'

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

filetype plugin indent on
set autowrite

" Go syntax highlighting
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status Line types/signatures
let g:go_auto_type_info = 1

" Disable swapfile
set noswapfile

" Js Vim
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

" Move to previous/next
nnoremap <silent> <C-6> :BufferPrevious<CR>
nnoremap <silent> <C-7> :BufferNext<CR>

set splitright
" Open Terminal
function! OpenTerminal()
        execute "normal \<C-l>"
        execute "normal \<C-l>"
        execute "normal \<C-l>"
        execute "normal \<C-l>"

        let bufNum = bufnr("%")
        let bufType = getbufvar(bufNum, "&buftype", "not found")

        if bufType == "terminal"
                execute "q"
        else
                execute "vsp term://fish"
                execute "set nonu"
                execute "set nornu"

                silent au BufLeave <buffer> stopinsert!
                silent au BufWinEnter,WinEnter <buffer> startinsert!

                execute "tnoremap <buffer> <C-h> <C-\\><C-w><C-h>"
                execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
                execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

                startinsert!
        endif
endfunction

nnoremap <C-t> :call OpenTerminal()<CR>
