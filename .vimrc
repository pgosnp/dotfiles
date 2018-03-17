" Basic setting {
set nocompatible   " 關閉兼容模式   
set number         " 顯示行號
set relativenumber " 開啟相對行號
set backspace=2    " 設置退格鍵可用
set ruler          " 右下角顯示光標位置的狀態行
set autoindent     " 自動對齊
set smartindent    " 智能對齊
set tabstop=4      " 設置tab的跳數   
set mouse=a        " 設置在任何模式下鼠標都可用
set hlsearch       " 高亮顯示查找結果
set incsearch      " 輸入搜索內容時就顯示搜索結果   
set shiftwidth=4   " 換行時，交錯使用4個空格
set foldmethod=indent  " Enable folding
set foldlevel=99
set ff=unix
syntax enable      " 打開語法高亮
syntax on          " 開啟文件類型偵測      
filetype off                  " required
let mapleader=";"
" }

" Vundle {
	
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'luochen1990/rainbow'
Plugin 'kien/ctrlp.vim'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required
	
" }

" Tab頁面function {

map     <C-T>       :tabnew<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" }

" 映射複製、粘貼、剪貼、全選、保存、撤銷 {
map <C-V> "+pa<Esc>
map! <C-V> <Esc>"+pa
map <C-C> "+y
map <C-X> "+x
map <C-A> ggVG
map! <C-A> <Esc>ggVG
map <C-W> :w<CR>
inoremap <C-W> <C-O>:w<CR>
" map <C-Z> :u<CR>
" map! <C-Z> <C-O>:u<CR>
"change word to uppercase, I love this very much
inoremap <C-u> <esc>gUiwea
" }

" Compile and run file {

autocmd filetype python nnoremap <F5> :w <bar> exec '!python3 ' shellescape('%')<CR>
autocmd FileType java nnoremap <F5> :w <bar> exec '!javac ' shellescape('%') ' && java' shellescape('%')<cr>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc ' shellescape('%') ' -o ' shellescape('%:r') ' && ' shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ ' shellescape('%') ' -o ' shellescape('%:r') ' && ' shellescape('%:r')<CR>
noremap<F4> :Autoformat<CR>
" }

" NERDTree {

let NERDTreeWinSize=25
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowLineNumbers=1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 顯示書籤列表
let NERDTreeShowBookmarks = 1

" }

" Emmet {
let g:user_emmet_leader_key='<C-F>'

" }

" UltiSnips {

let g:UltiSnipsExpandTrigger = '<C-d>'
let g:UltiSnipsJumpForwardTrigger = '<C-d>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" }

" Airline {

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" }

" Syntastic {

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>

" }

" Rainbow {

let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" } 
