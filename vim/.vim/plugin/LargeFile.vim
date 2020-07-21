" LargeFile: Sets up an autocmd to make editing large files work with celerity
"   Author:		Charles E. Campbell, Jr.
"   Date:		May 18, 2011
"   Version:	5i	ASTRO-ONLY
"   Copyright:	see :help LargeFile-copyright
" GetLatestVimScripts: 1506 1 :AutoInstall: LargeFile.vim

" ---------------------------------------------------------------------
" Load Once: {{{1
if exists("g:loaded_LargeFile") || &cp
 finish
endif
let g:loaded_LargeFile = "v5i"
let s:keepcpo          = &cpo
set cpo&vim

" ---------------------------------------------------------------------
" Commands: {{{1
com! Unlarge			call s:Unlarge()
com! -bang Large		call s:LargeFile(<bang>0,expand("%"))

" ---------------------------------------------------------------------
"  Options: {{{1
if !exists("g:LargeFile")
 let g:LargeFile= 20	" in megabytes
endif

" ---------------------------------------------------------------------
"  LargeFile Autocmd: {{{1
" for large files: turns undo, syntax highlighting, undo off etc
" (based on vimtip#611)
augroup LargeFile
 au!
 au BufReadPre	* call <SID>LargeFile(0,expand("<afile>"))
 au BufReadPost	* call <SID>LargeFilePost()
augroup END

" ---------------------------------------------------------------------
" s:LargeFile: {{{2
fun! s:LargeFile(force,fname)
"  call Dfunc("s:LargeFile(force=".a:force." fname<".a:fname.">) g:LargeFile=".g:LargeFile)
  let fsz= getfsize(a:fname)
"  call Decho("fsz=".fsz)
  if a:force || fsz >= g:LargeFile*1024*1024 || fsz <= -2
   sil! call s:ParenMatchOff()
   syn clear
   let b:LargeFile_mode = 1
"   call Decho("turning  b:LargeFile_mode to ".b:LargeFile_mode)
   let b:LF_bhkeep      = &l:bh
   let b:LF_cptkeep     = &cpt
   let b:LF_eikeep      = &ei
   let b:LF_fdmkeep     = &l:fdm
   let b:LF_fenkeep     = &l:fen
   let b:LF_swfkeep     = &l:swf
   let b:LF_ulkeep      = &ul
   set ei=FileType
   setlocal noswf bh=unload fdm=manual ul=-1 nofen cpt-=wbuU
   au LargeFile BufEnter <buffer> set ul=-1
   exe "au LargeFile BufLeave <buffer> let &ul=".b:LF_ulkeep."|set ei=".b:LF_eikeep
   au LargeFile BufUnload <buffer> au! LargeFile * <buffer>
   echomsg "***note*** handling a large file" 
  endif
"  call Dret("s:LargeFile")
endfun

" ---------------------------------------------------------------------
" s:LargeFilePost: {{{2
fun! s:LargeFilePost()
"  call Dfunc("s:LargeFilePost() ".line2byte(line("$")+1)."bytes g:LargeFile=".g:LargeFile.(exists("b:LargeFile_mode")? " b:LargeFile_mode=".b:LargeFile_mode : ""))
  if line2byte(line("$")+1) >= g:LargeFile*1024*1024
   if !exists("b:LargeFile_mode") || b:LargeFile_mode == 0
	call s:LargeFile(1,expand("<afile>"))
   endif
  endif
"  call Dret("s:LargeFilePost")
endfun

" ---------------------------------------------------------------------
" s:ParenMatchOff: {{{2
fun! s:ParenMatchOff()
"  call Dfunc("s:ParenMatchOff()")
   redir => matchparen_enabled
    com NoMatchParen
   redir END
   if matchparen_enabled =~ 'g:loaded_matchparen'
	let b:LF_nmpkeep= 1
	NoMatchParen
   endif
"  call Dret("s:ParenMatchOff")
endfun

" ---------------------------------------------------------------------
" s:Unlarge: this function will undo what the LargeFile autocmd does {{{2
fun! s:Unlarge()
"  call Dfunc("s:Unlarge()")
  let b:LargeFile_mode= 0
"  call Decho("turning  b:LargeFile_mode to ".b:LargeFile_mode)
  if exists("b:LF_bhkeep") |let &l:bh  = b:LF_bhkeep |unlet b:LF_bhkeep |endif
  if exists("b:LF_fdmkeep")|let &l:fdm = b:LF_fdmkeep|unlet b:LF_fdmkeep|endif
  if exists("b:LF_fenkeep")|let &l:fen = b:LF_fenkeep|unlet b:LF_fenkeep|endif
  if exists("b:LF_swfkeep")|let &l:swf = b:LF_swfkeep|unlet b:LF_swfkeep|endif
  if exists("b:LF_ulkeep") |let &ul    = b:LF_ulkeep |unlet b:LF_ulkeep |endif
  if exists("b:LF_eikeep") |let &ei    = b:LF_eikeep |unlet b:LF_eikeep |endif
  if exists("b:LF_cptkeep")|let &cpt   = b:LF_cptkeep|unlet b:LF_cptkeep|endif
  if exists("b:LF_nmpkeep")
   DoMatchParen          
   unlet b:LF_nmpkeep
  endif
  syn on
  doau FileType
  echomsg "***note*** stopped large-file handling"
"  call Dret("s:Unlarge")
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
