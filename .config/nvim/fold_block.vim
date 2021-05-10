" ******************** Zawijanie bloków ********************
set nofoldenable

" Not working properly, fold too much
function GetPerlFold()
	if getline(v:lnum) =~ '^\s*sub\s'
		return ">1"
	elseif getline(v:lnum) =~ '^\s*fun\s'
		return ">1"
	elseif getline(v:lnum) =~ '^\s*method\s'
		return ">1"
	elseif getline(v:lnum) =~ '\}\s*$'
		let my_perlnum = v:lnum
		let my_perlmax = line("$")
		while (1)
			let my_perlnum = my_perlnum + 1
			if my_perlnum > my_perlmax
				return "<1"
			endif
			let my_perldata = getline(my_perlnum)
			if my_perldata =~ '^\s*\(\#.*\)\?$'
				" do nothing
			elseif my_perldata =~ '^\s*sub\s'
				return "<1"
			else
				return "="
			endif
		endwhile
	else
		return "="
	endif
endfunction
setlocal foldexpr=GetPerlFold()
setlocal foldmethod=expr

