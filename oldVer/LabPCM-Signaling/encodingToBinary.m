# ms_qcodes := arreglo que contiene una señal codificada cuantizada
# WW        := tamaño de la pabrabra usada en la cuantizacion
function [ms_qcodes_bin]=encodingToBinary(ms_qcodes, WW)
  ms_qcodes_bin = [];
  for c = ms_qcodes
    bin = dec2bin(c, WW);
    for i = 1:WW
      ms_qcodes_bin = [ms_qcodes_bin str2double(bin(i))];
    endfor
  endfor
endfunction
