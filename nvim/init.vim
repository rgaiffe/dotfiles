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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"
" Go
Plugin 'fatih/vim-go'
"
" Rust
Plugin 'rust-lang/rust.vim'
"
" Telescope
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-lua/plenary.nvim'
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
Plugin 'mhinz/vim-signify'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'catppuccin/nvim'
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
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
"
" For material
set termguicolors
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }
colorscheme catppuccin
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
" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
"
" Some options
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set t_Co=256
set number
set encoding=UTF-8
set mouse=a
"
" Map leader
let mapleader=","

" Nerdree syntax highlight
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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
" Telescope
nnoremap <leader>gf :lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })<CR>
" HB
"   Generate hcl
nnoremap <Leader>gh :!make generate-hcl
"   Plan / Apply prod
nnoremap <Leader>planeuprod :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=europe-west1 PROJECT=euprod STACK=
nnoremap <Leader>appeuprod :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=europe-west1 PROJECT=euprod STACK=
nnoremap <leader>planusprod :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=us-central1 PROJECT=usprod STACK=
nnoremap <leader>appusprod :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=us-central1 PROJECT=usprod STACK=
nnoremap <leader>planchprod :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=europe-west6 PROJECT=chprod STACK=
nnoremap <leader>appchprod :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=europe-west6 PROJECT=chprod STACK=
nnoremap <leader>planapac :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=australia-southeast1 PROJECT=apacprod STACK=
nnoremap <leader>appapac :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=australia-southeast1 PROJECT=apacprod STACK=
"   Plan / Apply sandbox
nnoremap <Leader>planeusandbox :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=europe-west1 PROJECT=eusandbox STACK=
nnoremap <Leader>appeusandbox :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=europe-west1 PROJECT=eusandbox STACK=
nnoremap <leader>planussandbox :make -C $HOME/work/01-GIT/k8s plan ENV=prod REGION=us-central1 PROJECT=ussandbox STACK=
nnoremap <leader>appussandbox :make -C $HOME/work/01-GIT/k8s apply ENV=prod REGION=us-central1 PROJECT=ussandbox STACK=
"   Plan / Apply hprod
nnoremap <Leader>planwip :make -C $HOME/work/01-GIT/k8s plan ENV=hprod REGION=europe-west1 PROJECT=wip STACK=
nnoremap <Leader>appwip :make -C $HOME/work/01-GIT/k8s apply ENV=hprod REGION=europe-west1 PROJECT=wip STACK=
nnoremap <Leader>planbarney :make -C $HOME/work/01-GIT/k8s plan ENV=hprod REGION=europe-west1 PROJECT=barney STACK=
nnoremap <Leader>appbarney :make -C $HOME/work/01-GIT/k8s apply ENV=hprod REGION=europe-west1 PROJECT=barney STACK=
nnoremap <Leader>planstaging :make -C $HOME/work/01-GIT/k8s plan ENV=hprod REGION=europe-west1 PROJECT=staging STACK=
nnoremap <Leader>appstaging :make -C $HOME/work/01-GIT/k8s apply ENV=hprod REGION=europe-west1 PROJECT=staging STACK=
nnoremap <Leader>planinteg :make -C $HOME/work/01-GIT/k8s plan ENV=hprod REGION=europe-west1 PROJECT=integration STACK=
nnoremap <Leader>appinteg :make -C $HOME/work/01-GIT/k8s apply ENV=hprod REGION=europe-west1 PROJECT=integration STACK=
