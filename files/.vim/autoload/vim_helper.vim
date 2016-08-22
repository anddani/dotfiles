" Get current filename
function vim_helper#Filename(...)
  let filename = expand('%:t:r')

  if filename == ''
      return 'UNKNOWN_FILENAME'
  else
      return filename
  endif
endf
