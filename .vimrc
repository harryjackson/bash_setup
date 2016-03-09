" Some Linux distributions set filetype in /etc/vimrc.
" " Clear filetype flags before changing runtimepath to force Vim to reload
" them.
filetype off
filetype plugin indent off
set runtimepath+=$GOPATH/misc/vim
filetype plugin indent on
set nocompatible
syntax on
syntax enable
set modeline
au BufNewFile,BufRead */apache2/*.conf* setf apache 
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.go set filetype=go 

"Theme
set background=dark
set t_Co=256
"colorscheme zenburn
"colorscheme mayansmoke
colorscheme kolor
"colorscheme molokai
"colorscheme solarized

set runtimepath^=~/.vim/bundle/ctrlp.vim

set autoindent
set autowrite
set visualbell t_vb=
set number
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set mat=2
set nohlsearch
set foldenable
set foldmethod=marker
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set history=1024
set ruler
set hid
set viminfo='20,\"50
set backspace=2 whichwrap+=<,>,h,l
set nocindent
set cmdheight=2
set comments=b:#,b:\",n:>
set ignorecase
set magic
set hlsearch
noremap <F1> <Esc>:CtrlP<CR>
noremap <F2> <Esc>:make<CR>
noremap <F3> <Esc>:ls<CR>
map <F6> :mksession! ~/.vim/vim_session<CR>
map <F7> :source     ~/.vim/vim_session<CR>
map <F8> :mksession! ~/.vim/vim_session_w<CR>
map <F9> :source     ~/.vim/vim_session_w<CR>
let mapleader = ","
nmap <leader>s :CtrlP<cr>
nmap <leader>ss :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>d :bd<cr>
nmap <leader>lb :set buflisted<cr>
nmap <leader>lhut :cd /git/hutter<cr>:args src/*<cr>:CtrlP<cr>
set wildignore+=*.so,*.swp,*.zip
"autocmd BufWritePost *.c,*.h make
autocmd FileType make setlocal noexpandtab
autocmd FileType c setlocal foldmethod=manual
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=1       "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set tags=/git/hutter/tags
set hidden
filetype on
filetype plugin on
filetype indent on
set hidden

"set backspace=indent,eol,start

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction

""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2
set noshowmode
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'




"autocmd bufnewfile *.c so $HOME/.vim/c_header.txt
"autocmd bufnewfile *.c exe "1," . 10 . "g/File Name:.*/s//File Name: " .expand("%")
"autocmd bufnewfile *.c exe "1," . 10 . "g/Complier:.*/s//Complier: " .expand("gcc")
"autocmd bufnewfile *.c exe "1," . 10 . "g/Author:.*/s//Author: Harry Jackson"
"autocmd Bufwritepre,filewritepre *.c execute "normal ma"
"autocmd bufwritepost,filewritepost *.c execute "normal `a"
"
hi Search cterm=NONE ctermfg=grey ctermbg=blue
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 15
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h15
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"let g:airline#extensions#tabline#enabled = 1


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'wincent/command-t'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/slimv.vim'
call vundle#end()            " required
filetype on 
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"slimv
let g:slimv_swank_cmd = '!/bin/bash -c "/usr/local/bin/clisp ~/.vim/slime/start-swank.lisp" &'
"let g:ShellSet = 'set '

" limit text files to 78 chars
" autocmd BufRead *.txt set textwidth=78

" " List of words from Microsoft Word 7, with some additions
" " Author: Matt Corks <mvcorks@alumni.uwaterloo.ca>
ab accesories accessories
ab accomodate accommodate
ab acheive achieve
ab acheiving achieving
ab acn can
ab acommodate accommodate
ab acomodate accommodate
ab adn and
ab agian again
ab ahppen happen
ab ahve have
ab allready already
ab almsot almost
ab alot a lot
ab alreayd already
ab alwasy always
ab amke make
ab anbd and
ab andthe and the
ab appeares appears
ab aplyed applied
ab artical article
ab audeince audience
ab audiance audience
ab awya away
ab bakc back
ab balence balance
ab baout about
ab bcak back
ab beacuse because
ab becasue because
ab becomeing becoming
ab becuase because
ab becuse because
ab befoer before
ab begining beginning
ab beleive believe
ab boxs boxes
ab bve be
ab changeing changing
ab charachter character
ab charecter character
ab charector character
ab cheif chief
ab circut circuit
ab claer clear
ab claerly clearly
ab cna can
ab colection collection
ab comany company
ab comapny company
ab comittee committee
ab commitee committee
ab committe committee
ab committy committee
ab compair compare
ab compleated completed
ab completly completely
ab comunicate communicate
ab comunity community
ab conected connected
ab cotten cotton
ab coudl could
ab cpoy copy
ab cxan can
ab danceing dancing
ab definately definitely
ab develope develop
ab developement development
ab differant different
ab differnt different
ab diffrent different
ab disatisfied dissatisfied
ab doese does
ab doign doing
ab doller dollars
ab donig doing
ab driveing driving
ab drnik drink
ab ehr her
ab embarass embarrass
ab equippment equipment
ab esle else 
ab excitment excitement
ab eyt yet 
ab familar familiar
ab feild field
ab fianlly finally
ab fidn find
ab firts first
ab follwo follow
ab follwoing following
ab foriegn foreign
ab fro for
ab foudn found
ab foward forward
ab freind friend
ab frmo from
ab fwe few
ab gerat great
ab geting getting
ab giveing giving
ab goign going
ab gonig going
ab govenment government
ab gruop group
ab grwo grow
ab haev have
ab happend happened
ab haveing having
ab hda had
ab helpfull helpful
ab herat heart
ab hge he
ab hismelf himself
ab hsa has
ab hsi his
ab hte the
ab htere there
ab htey they
ab hting thing
ab htink think
ab htis this
ab hvae have
ab hvaing having
ab idae idea
ab idaes ideas
ab ihs his
ab immediatly immediately
ab indecate indicate
ab insted intead
ab inthe in the
ab iwll will
ab iwth with
ab jsut just
ab knwo know
ab knwos knows
ab konw know
ab konws knows
ab levle level
ab libary library
ab librarry library
ab librery library
ab librarry library
ab liek like
ab liekd liked
ab liev live
ab likly likely
ab littel little
ab liuke like
ab liveing living
ab loev love
ab lonly lonely
ab makeing making
ab mkae make
ab mkaes makes
ab mkaing making
ab moeny money
ab mroe more
ab mysefl myself
ab myu my
ab neccessary necessary
ab necesary necessary
ab nkow know
ab nwe new
ab nwo now
ab ocasion occasion
ab occassion occasion
ab occurence occurrence
ab occurrance occurrence
ab ocur occur
ab oging going
ab ohter other
ab omre more
ab onyl only
ab optoin option
ab optoins options
ab opperation operation
ab orginized organized
ab otehr other
ab otu out
ab owrk work
ab peopel people
ab perhasp perhaps
ab perhpas perhaps
ab pleasent pleasant
ab poeple people
ab porblem problem
ab probelm problem
ab protoge protege
ab puting putting
ab pwoer power
ab quater quarter
ab questoin question
ab reccomend recommend
ab reccommend recommend
ab receieve receive
ab recieve receive
ab recieved received
ab recipie recipe
ab recipies recipes
ab recomend recommend
ab reconize recognize
ab recrod record
ab religous religious
ab rwite write
ab rythm rhythm
ab seh she
ab selectoin selection
ab sentance sentence
ab seperate separate
ab shineing shining
ab shiped shipped
ab shoudl should
ab similiar similar
ab smae same
ab smoe some
ab soem some
ab sohw show
ab soudn sound
ab soudns sounds
ab statment statement
ab stnad stand
ab stopry story
ab stoyr story
ab stpo stop
ab strentgh strength
ab struggel struggle
ab sucess success
ab swiming swimming
ab tahn than
ab taht that
ab talekd talked
ab tath that
ab teh the
ab tehy they
ab tghe the
ab thansk thanks
ab themselfs themselves
ab theri their
ab thgat that
ab thge the
ab thier their
ab thme them
ab thna than
ab thne then
ab thnig thing
ab thnigs things
ab thsi this
ab thsoe those
ab thta that
ab tihs this
ab timne time
ab tje the
ab tjhe the
ab tkae take
ab tkaes takes
ab tkaing taking
ab tlaking talking
ab todya today
ab tongiht tonight
ab tonihgt tonight
ab towrad toward
ab truely truly
ab tyhat that
ab tyhe the
ab useing using
ab veyr very
ab vrey very
ab waht what
ab watn want
ab wehn when
ab whcih which
ab whic which
ab whihc which
ab whta what
ab wief wife
ab wierd weird
ab wihch which
ab wiht with
ab windoes windows
ab withe with
ab wiull will
ab wnat want
ab wnated wanted
ab wnats wants
ab woh who
ab wohle whole
ab wokr work
ab woudl would
ab wriet write
ab wrod word
ab wroking working
ab wtih with
ab wya way
ab yera year
ab yeras years
ab ytou you
ab yuo you
ab yuor your
" Days of weeks
ab monday Monday
ab tuesday Tuesday
ab wednesday Wednesday
ab thursday Thursday
ab friday Friday
ab saturday Saturday
ab sunday Sunday

" Canadian spellings
" ab colour color
" ab honor honour

" Other
" ab xmas christmas
" ab Xmas Christmas
" 
syntax enable
syntax on
