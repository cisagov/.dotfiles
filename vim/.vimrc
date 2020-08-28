version 5.0
if has("terminfo")
    set t_Co=16
    set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
    set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

set nocompatible
let cpo_save=&cpo
set cpo=B
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
nmap <F9> :set hlsearch!<C-M>
let &cpo=cpo_save
unlet cpo_save
set background=dark
set formatoptions=tcq2
set guifont=-schumacher-clean-bold-r-normal-*-*-160-*-*-c-*-iso646.1991-irv
highlight normal guibg=black guifg=white
set mouse=a
set textmode
set autoindent
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set incsearch
set number
set ignorecase
set nohlsearch
let java_allow_cpp_keywords=1
let java_highlight_functions=1
let java_highlight_java_lang_ids=1
syntax on
set laststatus=2
set statusline=%<%F%=\ [%1*%M%*%n%R%H]\ \ %-25(%3l,%c%03V\ \ %P\ (%L)%)%12o'%03B'
" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %
