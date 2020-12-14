function bitStream = getBitStream(filename)
  file = fopen(filename);
  bitStream = dec2bin(fread(file, 'char'));
endfunction