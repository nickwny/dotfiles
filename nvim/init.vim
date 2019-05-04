call plug#begin('~/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/a.vim'
"Plug 'jsfaint/gen_tags.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'chemzqm/denite-git'
"Plug 'ozelentok/denite-gtags'
Plug 'neomake/neomake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ozelentok/deoplete-gtags'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme one

set textwidth=80
set noexpandtab
set shiftwidth=4
set tabstop=4
set number
set signcolumn=yes
set autochdir
set noshowmode

syntax on
filetype plugin indent on
set fileencoding=utf-8
set fileencodings=utf-8,chinese

set backup
set backupdir=~/nvim/back

if has('gui')
	set lines=35
	set columns=100
	set langmenu=zh_CN.UTF-8
	language message zh_CN.UTF-8
	set guioptions=egt "m
	set mouse=a
	set mousehide
	set guicursor=a:block-blinkon0
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif

if has('vms')
	set nobackup
endif

let mapleader = ","

let g:netrw_dirhistmax=0

let g:airline_theme = 'one'

let g:signify_vcs_list = [ 'git' ]
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>
nnoremap <leader>gd :SignifyDiff<CR>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"let g:loaded_gentags#ctags = 1
"let g:gen_tags#statusline = 1
"let g:gen_tags#gtags_opts = '-c --verbose'

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = expand('~/AppData/Local/Programs/Python/Python37/python.exe')
set completeopt=menu,menuone

let g:echodoc#enable_at_startup = 1

call defx#custom#option('_', {
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'buffer_name': '',
	\ 'resume': 1
	\ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
"  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

nnoremap <silent><Leader>e :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>

"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
"let g:Lf_CommandMap = {'<C-F>': ['<C-D>']}
let g:Lf_CacheDirectory = expand('~/nvim/cache')
"let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_DefaultExternalTool = 'ag'
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-b>'
let g:Lf_Gtagslabel = 'native-pygments'
noremap <c-b> :<c-u>LeaderfBuffer<cr>
noremap <c-n> :<c-u>LeaderfMru<cr>
noremap <c-d> :<c-u><c-r>=printf("Leaderf gtags --stayOpen -d %s", expand("<cword>"))<cr><cr>
noremap <c-r> :<c-u><c-r>=printf("Leaderf gtags --stayOpen -r %s", expand("<cword>"))<cr><cr>
noremap <c-s> :<c-u><c-r>=printf("Leaderf gtags --stayOpen -s %s", expand("<cword>"))<cr><cr>
noremap <c-t> :<c-u>Leaderf gtags --current-buffer --stayOpen<cr>
