colorscheme base16-tomorrow

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  set guifont=Espresso\ Mono:h10
else
  set gfn=set guifont=EspressoMono\ 8
end

" set lines=248 columns=248
set lines=999 columns=999
set colorcolumn=80

" Hide toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=m
set background=dark
