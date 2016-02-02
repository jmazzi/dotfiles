"colorscheme base16-tomorrow
" colorscheme Tomorrow-Night
colorscheme solarized
set background=dark

set guifont=Espresso\ Mono:h10
map <D-t> :CtrlP<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
end

" set lines=248 columns=248
"set lines=999 columns=999
set colorcolumn=80

" Hide toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=m
