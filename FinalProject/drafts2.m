# carjpg = getBitStream('in/car.jpg');
# str = {};
# for b = carjpg
#  for i = 1:7
#    if b(i) == 0
#       str = {str '0'}
#    else
#    str = {str '1'}
#  endif
# endfor
# endfor
# str

#x = imread("in/car.jpg");
#x = imread("in/car.png");
#size(x)
clc 
clear
file = fopen("in/car.jpg");
bitStream = fread(file, Inf, 'uint8');
fclose("all");
str = "";
for byte = bitStream'
  for bit = dec2bin(byte)
    str = strcat(str, bit);
  endfor
endfor
str