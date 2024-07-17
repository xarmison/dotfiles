"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Some basics:
        set nocompatible
        filetype plugin on
        syntax on
        set encoding=utf-8
        set number
        set tabstop=4
" Enable autocompletion:
        set wildmode=longest,list,full

" Disables automatic commenting on newline:
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
        map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
        map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
        set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

" Check file in shellcheck:
        map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
        map <leader>b :vsp<space>$BIB<CR>
        map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
        nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
        map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
        map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
        autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
        let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
        autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
        autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text:
        autocmd BufRead,BufNewFile *.md set tw=79

" Use urlscan to choose and open a url:
        :noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
        :noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
        vnoremap <C-c> "+y
        map <C-p> "+P

" Enable Goyo by default for mutt writting
        " Goyo's width will be the line limit in mutt.
        autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
        autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Automatically deletes all trailing whitespace on save.
        autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
        autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
        autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Navigating with guides
        inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
        vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
        map <Space><Tab> <Esc>/<++><Enter>"_c4l

