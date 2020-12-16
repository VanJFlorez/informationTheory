function fig=writeImage(txt)

  %txt - Cadena del archivo de texto
  
  n = length(txt)
  pixelsN = ceil(sqrt(n))   #Para la matriz imagen, la cual sera cudrada
  left = mod(n,pixelsN);
  
  for i=1:left
    txt=strcat(txt,"0");
  endfor
  
  txt
  
  r = zeros(pixelsN, pixelsN);
  %g = zeros(pixelsN, pixelsN)
  %b = zeros(pixelsN, pixelsN)
  
  for i=1:pixelsN
    
    for j=1:pixelsN
    
      r(i,j)= (toascii(txt((i-1)*pixelsN+j)) - 97)/27;
      
    endfor
    
  endfor  
  
  r
  
  fig=gray2ind (r);
  image(fig);
  imwrite(fig, "img.jpg") ;
  
endfunction
