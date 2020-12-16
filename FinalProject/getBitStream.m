function str = getBitStream(filename) 
  file = fopen(filename);
  bitStream = fread(file, Inf, 'uint8');
  fclose("all");
  str = "";
  for byte = bitStream'
    for bit = dec2bin(byte)
      str = strcat(str, bit);
    endfor
  endfor
endfunction