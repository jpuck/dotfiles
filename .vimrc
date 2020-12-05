set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoread
set wrap linebreak
syntax on

" show tab chars
set list
set listchars=tab:▸▸

" higlight 81st column
" https://stackoverflow.com/a/13731714/4233593
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" show trailing whitespace
" https://stackoverflow.com/a/4617156/4233593
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
