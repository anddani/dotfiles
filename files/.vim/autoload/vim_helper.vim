" Get current filename
function vim_helper#Filename(...)
  let filename = expand('%:t:r')

  if filename == ''
      return 'UNKNOWN_FILENAME'
  else
      return filename
  endif
  " let template = get(a:000, 0, "$1")
  "
  " let arg2 = get(a:000, 1, "")
  "
  " let basename = expand('%:t:r')
  "
  " if basename == ''
  "   return arg2
  " else
  "   return substitute(template, '$1', basename, 'g')
  " endif
endf
