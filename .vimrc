"" Hello

if &loadplugins
 if has('packages')
  packadd! vim-fugitive
  packadd! vim-lsc
  packadd! vim-floaterm
  packadd! vim-airline
  packadd! vim-nerdtree
  packadd! vim-fzf
  packadd! vim-fzf-main
  packadd! vim-commentary
  packadd! vim-dispatch
  packadd! vim-gitgutter
  packadd! vim-gruvbox
  packadd! vim-bufexplorer
  packadd! vim-snippets
  packadd! vim-ultisnips
  packadd! vim-clang-format
 endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LSC config 
let g:lsc_server_commands = {
 \  'cpp': {
 \    'command': 'clangd', 
 \    'log_level': -1,
 \    'suppress_stderr': v:true
 \  }
 \}

" Use all the defaults (recommended):
let g:lsc_auto_map = v:true

" Apply the defaults with a few overrides:
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" ... or set only the commands you want mapped without defaults.
" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

cnoreabbrev fzf Files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:gruvbox_termcolors=16
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
