" vim: set foldmethod=marker foldlevel=0 nomodeline:
" Plug {{{
call plug#begin('~/.vim/bundle')

Plug '/usr/local/opt/fzf'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'direnv/direnv.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'kevinhui/vim-docker-tools'
Plug 'kshenoy/vim-signature'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-textobj-url'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sodapopcan/vim-twiggy'
Plug 'tfnico/vim-gradle'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug '~/.vim/bundle/vim-kieran'

" Has to be loaded at the end
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}
" Vim Settings {{{
" Manage Vim files
" Editing text
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backupfiles//
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamed              " Yank to * register (system clipboard)
set autoread                       " Auto read/write
set autowrite
set confirm                        " Raise dialogue instead of failing q/qa/w command
set fixendofline                   " Restore EOL if missing
set nobinary
set spelllang=en_gb                " English dictionary

set tabstop=4                      " Use 4 spaces to indent
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent                     " Use C-style indenting or indent from previous line
set smartindent
set formatoptions+=j               " Join comments

imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-k> <plug>(fzf-complete-word)

" Files buffers & tabs
set cdpath+=~/src

nnoremap <space>bd :bdelete<CR>
nnoremap <space>ba :bufdo bdelete<CR>

nnoremap <space>tc :tabclose<CR>
nnoremap <space>te :tabedit<space>
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
nmap <space>ev :vsplit %%
nmap <space>es :split %%
nmap <space>ee :edit %%
nmap <space>sa :saveas %%

" UI
set lazyredraw           " Execute macros faster
set mouse=a              " Enable mouse
set timeoutlen=1000      " Stop taking so long!
set ttimeoutlen=0

set shortmess=a          " Use shorter labels in UI
set shortmess+=I         " Don't give the Vim intro message
set shortmess+=T         " Trunacte messages in middle if too long for command line
set number               " Display line numbers
set completeopt=menuone  " Show pop up menu even when there's one match
set completeopt+=preview
set scrolloff=5          " Show context around cursor when scrolling
set splitbelow           " Natural split
set splitright
set cmdheight=2          " More command-line lines to help avoid 'hit-enter' prompts
set noshowmode           " Dont show mode—status bars do this for us

set termguicolors
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let challenger_deep_terminal_italics = 1
colorscheme challenger_deep
highlight Normal guibg=NONE ctermbg=NONE

set listchars=tab:>\ ,space:-,trail:-,extends:>,precedes:<,nbsp:+,eol:$

" Search
set ignorecase " Case insensitive search unless there's a mix
set smartcase
set hlsearch   " Highlight previous/current matches as they are typed
set incsearch
" }}}
" Mappings {{{
" FZF shortcuts
nnoremap <C-p> :FZF<CR>
nnoremap <leader>cd :call cd#fzf_ui()<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fh :History:<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fu :Buffers<CR>
nnoremap <leader>fj :call jira#fzf_ui()<CR>

" Easy edit / source VIMRC
nnoremap <leader>ve :vsplit ~/src/dotfiles/.vimrc<CR>
nnoremap <leader>va :vsplit ~/src/dotfiles/.vim/bundle/vim-kieran/plugin/abbreviations.vim<CR>
nnoremap <leader>vb :vsplit ~/src/dotfiles/.vim/bundle/vim-kieran<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vu :UltiSnipsEdit<CR>
nnoremap <leader>ze :vsplit ~/src/dotfiles/.zshrc<CR>
nnoremap <leader>zu :vsplit ~/src/dotfiles/utilities.zsh<CR>

" Git shortcuts
nnoremap <leader>ga :Git add %<CR><CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gcop :Twiggy<CR>
nnoremap <leader>gcon :Git checkout -b<SPACE>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gdt :Git difftool<CR><CR>
nnoremap <leader>gdtc :Git difftool --cached<CR><CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>ggl :Gpull<CR>
nnoremap <leader>ggp :Gpush<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gpr :Hub pull-request -r benwainwright,andrewscfc,lalkhum,cefn,saralk<CR>
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gx :GV<CR>

" Show / hide the hidden characters
nnoremap <leader>l :setlocal list!<CR>

" Toggle relativenumber
nnoremap <leader>n :call NumberToggle()<CR>

" Sort a selection
vnoremap <leader>s :sort u<CR>

" Remove highlight
nnoremap <leader>o :noh<CR>

" Dispatch
nnoremap <leader>df :Focus make<space>

" Test
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>

" Jira commands
nnoremap <leader>jb :call jira#browse(jira#ticketFromBranch())<CR><CR>
nnoremap <leader>jc :call jira#comment(jira#ticketFromBranch())<CR>

" Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" Saner 'n' directions
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" Ag in word
nnoremap <leader>aiw :execute('Ag ' . expand("<cword>"))<CR>

" Last inserted text
nnoremap g. :normal! `[v`]<cr><left>


" Docker tools
nnoremap <leader>dkp :DockerToolsToggle<CR>

" Escape terminal with normal <esc> key
tnoremap <Esc> <C-\><C-n>

" Get the highlight colours under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Open current directory
nnoremap <leader>fn :!open .<CR><CR>

" Save faster!
nnoremap <leader>w :w<CR>

" Jid
nnoremap <leader>j :call Jid()<CR>

" }}}
" Functions. {{{
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

function! OpenSwps()
    execute "!open ~/.vim/swapfiles/"
endfunc

function! StripTrailingWhitespaces()
    "Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Do the business:
    %s/\s\+$//e

    " Clean up: restore previous search history / cursor
    let @/=_s
    call cursor(l, c)
endfunc

function! GoyoEnter()
    Limelight
    execute 'match ErrorMsg /\%81v.\+/'
    silent !tmux set status off
endfunction

function! GoyoLeave()
    Limelight!
    call clearmatches()
    silent !tmux set status on
endfunction

function! s:open_branch_fzf(line)
    let l:parser = split(a:line)
    let l:branch = l:parser[0]
    if l:branch ==? '*'
        let l:branch = l:parser[1]
    endif
    execute 'Git checkout ' . l:branch
endfunction

function! LanguageClientMaps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif
endfunction

function! Jid()
    execute '!jid < %'
endfunction

command! -nargs=0 Gmypullrequests execute '!open https://github.com/pulls'
" }}}
" Commands. {{{
command! -nargs=* Hub !hub <args>
command! -nargs=* Jira !jira <args>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=0 GCheckout
            \ call fzf#vim#grep(
            \   'git branch -v', 0,
            \   {
            \     'sink': function('s:open_branch_fzf')
            \   },
            \   <bang>0
            \ )
" }}}
" {{{ Autocmd
" Highlight trailing spaces
augroup vimrc
    autocmd!

    " File types.
    autocmd BufNewFile,BufRead *.conf setfiletype nginx
    autocmd BufNewFile,BufRead *.hbs setfiletype html
    autocmd BufNewFile,BufRead *.json.dist setfiletype json
    autocmd BufNewFile,BufRead *.mustache setfiletype html
    autocmd BufNewFile,BufRead *.puml setfiletype plantuml
    autocmd BufNewFile,BufRead *.spv setfiletype dockerfile
    autocmd BufNewFile,BufRead .Brewfile setfiletype ruby
    autocmd BufNewFile,BufRead .ctags setfiletype ctags
    autocmd BufNewFile,BufRead .env.* setfiletype sh
    autocmd BufNewFile,BufRead .npmrc setfiletype dosini
    autocmd BufNewFile,BufRead .tern-project setfiletype json
    autocmd BufNewFile,BufRead Brewfile setfiletype ruby
    autocmd BufNewFile,BufRead Dockerfile.* setfiletype dockerfile
    autocmd BufNewFile,BufRead Jenkinsfile setfiletype groovy
    autocmd BufNewFile,BufRead Jenkinsfile.* setfiletype groovy
    autocmd BufNewFile,BufRead config setfiletype dosini
    autocmd BufNewFile,BufRead hub setfiletype yaml
    autocmd FileType * call LanguageClientMaps()

    " Highlight whitespace.
    autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
    autocmd BufWinEnter,InsertLeave * match ErrorMsg /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " Remove whitespace.
    autocmd BufWritePre * :call StripTrailingWhitespaces()

    " Override tabs/spaces.
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType javascript,json,javascript.jsx,ruby,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

    " Set spelling / linebreak for text files.
    autocmd FileType gitcommit,markdown,conf setlocal spell
    autocmd FileType gitcommit,markdown,conf setlocal linebreak
    autocmd FileType gitcommit,markdown,conf setlocal textwidth=80 colorcolumn=80

    " Set local format programs according to filetypes.
    autocmd FileType json setlocal formatprg='jq'

    " Emoji for text files.
    autocmd FileType gitcommit,markdown setlocal omnifunc=emoji#complete

    " When entering/exiting Goyo, turn Limelight on / off.
    autocmd! User GoyoEnter nested call GoyoEnter()
    autocmd! User GoyoLeave nested call GoyoLeave()

augroup end
" }}}
" Plugins. {{{
" Airline/Tmuxline
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:airline_extensions=['ale','branch', 'hunks']

let g:airline_powerline_fonts=0
let g:tmuxline_powerline_separators=0

let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.readonly = ''

let g:airline_detect_spelllang=0

let g:airline_theme="challenger_deep"

" Dont conceal quotes when viewing JSON
let g:vim_json_syntax_conceal=0

" Set the Ultisnips directory
let g:UltiSnipsSnippetsDir='~/.vim/ultisnips'

" Set the Ultisnips edit window to split vertically
let g:UltiSnipsEditSplit="vertical"

" Ack to use Ag
let g:ackprg='ag --vimgrep --hidden'
let g:ack_use_dispatch=1

" Test strategy is Dispatch
let test#ruby#use_binstubs = 0
let test#strategy = "dispatch"

" Sneak config
let g:sneak#label = 1
highlight! link Sneak Search
highlight! link SneakScope Search

" ALE
let g:ale_sign_error = ""
let g:ale_sign_warning = ""
let g:ale_linters={
            \'python':['flake8', 'mypy', 'pylint', 'pyls2']
            \}
let g:ale_python_pyls_use_global = 1

highlight! link ALEWarningSign ALEWarning

" Gitgutter
let g:gitgutter_sign_removed = emoji#for('fire')

" Dash
let g:dash_map = { 'yaml': ['cloudformation'] }

" Language Client
let g:LanguageClient_serverCommands = {
            \ 'javascript': ['tcp://127.0.0.1:2089'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ 'python': ['tcp://127.0.0.1:2090']
            \}
" }}}
