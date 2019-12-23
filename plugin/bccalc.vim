"" calculate expression entered on command line and give answer, e.g.:
" :Calculate sin (3) + sin (4) ^ 2
command! -nargs=+ Calculate echo "<args> = " . Calculate ("<args>")

"" calculate expression from visual selection
vnoremap <leader>bc "ey:call CalcLines(1)

"" calculate expression in the current unnamed register
noremap  <leader>bc "eyy:call CalcLines(0)

" ---------------------------------------------------------------------
"  Calculate:
"    clean up an expression, pass it to bc, return answer
function! Calculate (s)

	let l:str= a:s

	" remove newlines and trailing spaces
	let l:str= substitute (l:str, "\n",   "", "g")
	let l:str= substitute (l:str, '\s*$', "", "g")

	" sub common func names for bc equivalent
	let l:str = substitute (l:str, '\csin\s*(',  's (', 'g')
	let l:str = substitute (l:str, '\ccos\s*(',  'c (', 'g')
	let l:str = substitute (l:str, '\catan\s*(', 'a (', 'g')
	let l:str = substitute (l:str, "\cln\s*(",   'l (', 'g')
	let l:str = substitute (l:str, '\clog\s*(',  'l (', 'g')
	let l:str = substitute (l:str, '\cexp\s*(',  'e (', 'g')

	" alternate exponentiation symbols
	let l:str = substitute (l:str, '\*\*', '^', "g")

	" Substitute superscript characters like ² to become ^(2)

	let l:str = substitute(l:str, "[⁰¹²³⁴⁵⁶⁷⁸⁹]\\+", "^(&)", "g")
	"First put them in parenthesis
	
	let l:str = substitute(l:str, "⁰", 0, "g")
	let l:str = substitute(l:str, "¹", 1, "g")
	let l:str = substitute(l:str, "²", 2, "g")
	let l:str = substitute(l:str, "³", 3, "g")
	let l:str = substitute(l:str, "⁴", 4, "g")
	let l:str = substitute(l:str, "⁵", 5, "g")
	let l:str = substitute(l:str, "⁶", 6, "g")
	let l:str = substitute(l:str, "⁷", 7, "g")
	let l:str = substitute(l:str, "⁸", 8, "g")
	let l:str = substitute(l:str, "⁹", 9, "g")

	"Insert semicolons to allow longer expressions
	let l:str = substitute(l:str, "\\n", ";", "g")
	
	" escape chars for shell
	let l:str = escape (l:str, '*();&><|')

	let l:preload = exists ("g:bccalc_preload") ? g:bccalc_preload : ""

	" run bc
	let l:answer = system ("echo " . l:str . " \| bc -l " . l:preload)

	" strip newline
	let l:answer = substitute (l:answer, "\n", "", "")

	" strip trailing 0s in decimals
	let l:answer = substitute (l:answer, '\.\(\d*[1-9]\)0\+', '.\1', "")

	return l:answer
endfunction

" ---------------------------------------------------------------------
" CalcLines:
"
" take expression from lines, either visually selected or the current line, as
" passed determined by arg vsl, pass to calculate function, echo or past
" answer after '='
function! CalcLines(vsl)

	" replace newlines with semicolons and remove trailing spaces
	let @e = substitute (@e, "\n", ";", "g")
	let @e = substitute (@e, '\s*$', "", "g")

	let l:answer = Calculate (@e)

	" append answer or echo
	echo "answer = " . l:answer
	call setreg('"', l:answer)
endfunction
