set nocompatible
"
" Begin Setup Vundle
set rtp+=~/.config/nvim/bundle/Vundle.vim
filetype off
"
call vundle#begin()
"
" Vundle
Plugin 'VundleVim/Vundle.vim'
"
" Color
Plugin 'kaicataldo/material.vim'
"
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
"
" Fuzzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"
" Deoplete
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'deoplete-plugins/deoplete-jedi'
"
" Nerdtree
Plugin 'preservim/nerdtree'
"
" Go
Plugin 'fatih/vim-go'
"
" Rust
Plugin 'rust-lang/rust.vim'
"
" Terraform
Plugin 'hashivim/vim-terraform'
" Some plugins
Plugin 'universal-ctags/ctags'
Plugin 'w0rp/ale'
Plugin 'psf/black'
Plugin 'APZelos/blamer.nvim'
Plugin 'kdheepak/lazygit.nvim'
Plugin 'numToStr/FTerm.nvim'
Plugin 'github/copilot.vim'
" Plugin 'jbgutierrez/vim-better-comments' https://github.com/neovim/neovim/issues/12304
"
call vundle#end()
"
filetype plugin indent on
" End Setup Vundle
"
" ALE config
let g:ale_completion_enabled = 1
" blamer
let g:blamer_enabled = 1
let g:blamer_prefix = ' > '
"
" Ctags config
set tags=./tags,.tags;
"
" Deoplete config
let g:deoplete#enable_at_startup = 1
"
" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
"
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
"
" For material
set termguicolors
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material
"
" fzf config
" let g:fzf_layout = { 'left': '~20%' }
let g:fzf_action = { 'T': 'tab split', 'S': 'split', 'V': 'vsplit'}
"
" Rust
" Note: This feature requires webapi-vim to be installed.
" let g:rust_clip_command = 'xclip -selection clipboard'
let g:rustfmt_autosave = 1
"
" Some options
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set t_Co=256
set number
"
" Map leader
let mapleader=","
"
" Call black on save
autocmd BufWritePost *.py silent! execute ':Black'
"
" Custom shortcut
" Save
noremap		<C-S> :w<CR>
vnoremap	<C-S> <Esc>:w<CR>
inoremap	<C-S> <Esc>:w<CR>
"
" Quit
noremap		<C-Q> :q<CR>
vnoremap	<C-Q> <Esc>:q<CR>
inoremap	<C-Q> <Esc>:q<CR>
"
" Deoplete
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
"
" Fuzzy finder
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>Ff :Ag<CR>
"
" Open nvim config
nnoremap <leader>vrc  :tabnew $HOME/.config/nvim/init.vim<CR>
" Open ZSH config
nnoremap <leader>zsh  :tabnew $HOME/perso/01-GIT/dotfiles/shell/zshrc<CR>
" Open my_alias config
nnoremap <leader>mal  :tabnew $HOME/perso/01-GIT/dotfiles/shell/my_alias.sh<CR>
"
" Generate ctags python
nnoremap <leader>ct :silent ! ctags -R --languages=python--exclude=.git --exclude=.js --exclude=log -f .tags<cr>

