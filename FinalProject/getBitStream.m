function strStream = getBitStream(filename)
  file = fopen(filename);
  bitStream = fread(file, 'uint8');
  bin = dec2bin(bitStream);
  strStream = '';
  for b = bin
    strStream = strcat(strStream, b);
    b;
  endfor
endfunction