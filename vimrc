" From default vimrc
set scrolloff=5
" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
au!
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup END

" General
filetype plugin on
set encoding=utf8
set clipboard+=unnamedplus

" Appearance
set number
set wrap lbr
set tabstop=4
set softtabstop=4
set shiftwidth=4
set listchars=tab:¦\ ,trail:~,extends:>,precedes:<
set list
set guicursor=
" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Keyboard Shortcuts
nnoremap <S-tab> :bprev<Enter>
nnoremap <tab>   :bnext<Enter>
" Document navigation
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> <S-h> g^
noremap <silent> <S-j> 15gj
noremap <silent> <S-k> 15gk
noremap <silent> <S-l> g$
nmap <S-u> :redo<Enter>
" Editing
nmap <enter> o<esc>
nmap ; :
nmap < v<
nmap > v>
nmap <S-d> dd
vmap <S-y> ! xsel -b<enter>u
