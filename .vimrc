"
" Sayed Hasan's Vim Configuration file
"

"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

" source $HOME/.vim/bundle/vim-exvim/vimrc_ex

" Get pathogen up and running
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Add xptemplate global personal directory value
if has("unix")
  set shell=tcsh
  set runtimepath+=~/.vim/xpt-personal
else
  set shell=ksh
endif

colorscheme visualstudio
" set guifont=Inconsolata\ 14
" set guifont=Consolas\ for\ Powerline\ FixedD\ 14
set guifont=Consolas\ for\ Powerline\ FixedD\ 16

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set backspace=2  " Allow backspacing over indent, eol, and the start of an insert
" set backspace=eol,start,indent
set printoptions=header:0,duplex:long,paper:letter  " Printing options
set wrapscan  " set the search scan to wrap lines
set noignorecase
set shellslash
set vb  " set visual bell -- do not wring it
set hidden  " allow unsaved buffer
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2  " tell VIM to always put a status line in, even if there is only one window
set lazyredraw  " Don't update the display while executing macros
set showcmd
set showmode
set mousehide  " Hide the mouse pointer while typing
set showmatch  " Show the matching parentheses
" set guioptions=acg
set timeoutlen=500
set history=100
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set timeoutlen=500
set wildmenu
set complete=.,w,b,t
set showfulltag
set textwidth=120
set fillchars = ""
set hlsearch
set incsearch
set clipboard+=unnamed
set autoread
set grepprg=grep\ -nH\ $*
set diffopt+=iwhite
set number
set encoding=utf8
set autochdir
set ffs=unix,dos,mac
set magic    " magic regular expression


" Switch on syntax highlighting.
syntax on

" Enhance '<' '>' , do not need to reselect the block after shift it.
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" for Vim-latex
let g:tex_flavor='latex'

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" System default for mappings is now the "," character
let mapleader = ","

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" put the vim directives for my file editing settings in
nmap <silent> ,vi ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<CR>

nmap <silent> cp :let @" = expand("%")<CR>

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
 
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Buffer creation 
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
" map <BS>  :ConqueTerm tcsh<CR>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
        
" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" Tagbar plugin
nmap <F8> :TagbarToggle<CR>

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %:p<cr>:e<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Initial path seeding
set path=
set tags=

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
" let NERDTreeShowBookmarks=0

" " Don't display these kinds of files
" let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
"                    \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
"                    \ '\.embed\.manifest$', '\.embed\.manifest.res$',
"                    \ '\.intermediate\.manifest$', '^mt.dep$' ]
 

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>


"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_splitPathMatching = 0
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> ,fv :FufFile ~/.vim/<cr>
" nmap <silent> ,fc :FufMruCmd<cr>
" nmap <silent> ,fm :FufMruFile<cr>


"-----------------------------------------------------------------------------
" CommandT Settings
"-----------------------------------------------------------------------------
set wildignore+=*.o,*.class,.git,.svn
let g:CommandTMatchWindowAtTop = 1
nmap <silent> ,fb :CommandTBuffer<cr>
nmap <silent> ,ff :CommandT<cr>
nmap <silent> ,fp :CommandT ~/primal/platform<cr>


"-----------------------------------------------------------------------------
" Gundo Settings
"-----------------------------------------------------------------------------
nmap <c-F5> :GundoToggle<cr>


" -----------------------------------------------------------------------------
" Conque Settings
" -----------------------------------------------------------------------------
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_PromptRegex = '^-->'
let g:ConqueTerm_TERM = 'xterm'


"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------
if !exists('g:bufferJumpList')
    let g:bufferJumpList = {}
endif

function! MarkBufferInJumpList(bufstr, letter)
    let g:bufferJumpList[a:letter] = a:bufstr
endfunction

function! JumpToBufferInJumpList(letter)
    if has_key(g:bufferJumpList, a:letter)
        exe ":buffer " . g:bufferJumpList[a:letter]
    else
        echoerr a:letter . " isn't mapped to any existing buffer"
    endif
endfunction

function! ListJumpToBuffers()
    for key in keys(g:bufferJumpList)
        echo key . " = " . g:bufferJumpList[key]
    endfor
endfunction
 
function! IndentToNextBraceInLineAbove()
    :normal 0wk
    :normal "vyf(
    let @v = substitute(@v, '.', ' ', 'g')
    :normal j"vPl
endfunction

nmap <silent> ,ii :call IndentToNextBraceInLineAbove()<cr>
 
nmap <silent> ,mba :call MarkBufferInJumpList(expand('%:p'), 'a')<cr>
nmap <silent> ,mbb :call MarkBufferInJumpList(expand('%:p'), 'b')<cr>
nmap <silent> ,mbc :call MarkBufferInJumpList(expand('%:p'), 'c')<cr>
nmap <silent> ,mbd :call MarkBufferInJumpList(expand('%:p'), 'd')<cr>
nmap <silent> ,mbe :call MarkBufferInJumpList(expand('%:p'), 'e')<cr>
nmap <silent> ,mbf :call MarkBufferInJumpList(expand('%:p'), 'f')<cr>
nmap <silent> ,mbg :call MarkBufferInJumpList(expand('%:p'), 'g')<cr>
nmap <silent> ,jba :call JumpToBufferInJumpList('a')<cr>
nmap <silent> ,jbb :call JumpToBufferInJumpList('b')<cr>
nmap <silent> ,jbc :call JumpToBufferInJumpList('c')<cr>
nmap <silent> ,jbd :call JumpToBufferInJumpList('d')<cr>
nmap <silent> ,jbe :call JumpToBufferInJumpList('e')<cr>
nmap <silent> ,jbf :call JumpToBufferInJumpList('f')<cr>
nmap <silent> ,jbg :call JumpToBufferInJumpList('g')<cr>
nmap <silent> ,ljb :call ListJumpToBuffers()<cr>

function! DiffCurrentFileAgainstAnother(snipoff, replacewith)
    let currentFile = expand('%:p')
    let otherfile = substitute(currentFile, "^" . a:snipoff, a:replacewith, '')
    only
    execute "vertical diffsplit " . otherfile
endfunction

command! -nargs=+ DiffCurrent call DiffCurrentFileAgainstAnother(<f-args>)

function! RunSystemCall(systemcall)
    let output = system(a:systemcall)
    let output = substitute(output, "\n", '', 'g')
    return output
endfunction

function! HighlightAllOfWord(onoff)
    if a:onoff == 1
        :augroup highlight_all
            :au!
            :au CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
        :augroup END
    else
        :au! highlight_all
        match none /\<%s\>/
    endif
endfunction

:nmap ,ha :call HighlightAllOfWord(1)<cr>
:nmap ,hA :call HighlightAllOfWord(0)<cr>

function! LengthenCWD()
	let cwd = getcwd()
    if cwd == '/'
        return
    endif
	let lengthend = substitute(cwd, '/[^/]*$', '', '')
    if lengthend == ''
        let lengthend = '/'
    endif
    if cwd != lengthend
	    exec ":lcd " . lengthend
	endif
endfunction

:nmap ,ld :call LengthenCWD()<cr>

function! ShortenCWD()
	let cwd = split(getcwd(), '/')
	let filedir = split(expand("%:p:h"), '/')
    let i = 0
    let newdir = ""
    while i < len(filedir)
        let newdir = newdir . "/" . filedir[i]
        if len(cwd) == i || filedir[i] != cwd[i]
            break
        endif
        let i = i + 1
    endwhile
    exec ":lcd /" . newdir
endfunction

:nmap ,sd :call ShortenCWD()<cr>

function! RedirToYankRegisterF(cmd, ...)
    let cmd = a:cmd . " " . join(a:000, " ")
    redir @*>
    exe cmd
    redir END
endfunction

command! -complete=command -nargs=+ RedirToYankRegister 
  \ silent! call RedirToYankRegisterF(<f-args>)

function! ToggleMinimap()
    if exists("s:isMini") && s:isMini == 0
        let s:isMini = 1
    else
        let s:isMini = 0
    end

    if (s:isMini == 0)
        " save current visible lines
        let s:firstLine = line("w0")
        let s:lastLine = line("w$")

        " make font small
        exe "set guifont=" . g:small_font
        " highlight lines which were visible
        let s:lines = ""
        for i in range(s:firstLine, s:lastLine)
            let s:lines = s:lines . "\\%" . i . "l"

            if i < s:lastLine
                let s:lines = s:lines . "\\|"
            endif
        endfor

        exe 'match Visible /' . s:lines . '/'
        hi Visible guibg=lightblue guifg=black term=bold
        nmap <s-j> 10j
        nmap <s-k> 10k
    else
        exe "set guifont=" . g:main_font
        hi clear Visible
        nunmap <s-j>
        nunmap <s-k>
    endif
endfunction

command! ToggleMinimap call ToggleMinimap()

" I /literally/ never use this and it's pissing me off
" nnoremap <space> :ToggleMinimap<CR>

"-----------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------
function! FreemindToListF()
    setl filetype=
    silent! :%s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/
    silent! :g/^\s*</d
    silent! :%s/&quot;/"/g
    silent! :%s/&apos;/\'/g
    silent! g/^-/s/- //
    silent! g/^\w/t.|s/./=/g
    silent! g/^\s*-/normal O
    silent! normal 3GgqG
    silent! %s/^\s\{4}\zs-/o/
    silent! %s/^\s\{12}\zs-/+/
    silent! %s/^\s\{16}\zs-/*/
    silent! %s/^\s\{20}\zs-/#/
    silent! normal gg
endfunction

command! FreemindToList call FreemindToListF()

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
augroup Binary
  au!
  au BufNewFile,BufRead  *.mi set filetype=tcl
  au BufNewFile,BufRead  *.fi set filetype=tcl 
  au BufNewFile,BufRead *.pdb set filetype=tcl 
  au BufNewFile,BufRead *.log set filetype=tcl 
  au BufNewFile,BufRead   *.m set filetype=matlab
  au BufNewFile,BufRead *.inc set filetype=make
  au BufNewFile,BufRead *.dat set filetype=perl 
  au BufNewFile,BufRead *.t   set filetype=perl 
  au BufNewFile,BufRead zirconQA set fdm=marker
  " au BufNewFile,BufRead *.txt colorscheme slate 
augroup END

autocmd BufEnter *.m compiler mlint


"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------
iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab bianries   binaries
iab Bianry     Binary
iab bianry     binary
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Exmaple    Example
iab exmaple    example
iab Exmaples   Examples
iab exmaples   examples
iab Fone       Phone
iab fone       phone
iab Seperate   Separate
iab seperate   separate
iab Seureth    Suereth
iab seureth    suereth
iab Shoudl     Should
iab shoudl     should
iab Taht       That
iab taht       that
iab Teh        The
iab teh        the

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
 
" saving macros
let @a = ':%s/ //gggvG'

nmap <silent> ,src :set lines=42 columns=158<CR>
nmap <silent> ,srr :set lines=42<CR>
nmap <silent> ,scc :set columns=158<CR>
nmap <silent> <F5> :!%<CR>
imap <silent> <F5> <ESC>:w<CR>:!%<CR>
nmap <silent> <F6> :!perl -d:ptkdb %&<CR>

" perl related settings
let perl_include = 1
let perl_extended_vars = 1
let perl_want_scope_in_variables = 1
" let perl_fold = 1
" let perl_fold_blocks = 1

autocmd Filetype perl :set equalprg=perltidy\ -i=2\ -nt\ -msc=2\ -ci=2\ -dsm\ -asc\ -lp\ -l=110\ -isbc\ -dws\ -w
" nmap <silent> ,p ggO#!/usr/intel/pkgs/perl/5.8.5/bin/perl<CR><CR>use strict;<CR>use warnings;<CR><CR><ESC><C-V>4kx6Gdd:w<CR>:!chmod u+x %:p<CR>:e<CR>
nmap <silent> ,p ggO#!/usr/intel/pkgs/perl/5.14.1/bin/perl<CR><CR>use strict;<CR>use warnings;<CR><CR><ESC><C-V>4kx6Gdd:w<CR>:!chmod u+x %:p<CR>:e<CR>

" folding stuff
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" shortcut to bright colorschemes
nmap <silent> <C-S-F1> :colorscheme visualstudio<CR> 
nmap <silent> <C-S-F3> :colorscheme dual<CR>
nmap <silent> <C-S-F5> :colorscheme emacs<CR>
nmap <silent> <C-S-F7> :colorscheme default<CR>

" shortcut to mte colorschemes
nmap <silent> <C-S-F2> :colorscheme slate<CR>
nmap <silent> <C-S-F4> :colorscheme xoria256<CR>
nmap <silent> <C-S-F6> :colorscheme mustang<CR>
