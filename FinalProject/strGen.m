function str=strGen(sz, ranGen)
  
  str = "";
  # https://octave.sourceforge.io/octave/function/rand.html
  if strcmp(ranGen, "pure")
    for i=1:N
      a = floor(rand(1)*27) + 97;
      str = strcat(str,char(a)); 
    endfor
  elseif strcmp(ranGen, "repeated")
    
  elseif strcmp(ranGen, "binord")
    # todo
  else
    
  endif
endfunction
