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
# str = strRandom(100)



clc
clear
N = 10
str = strRandom(N*N)
img = [];
row = [];
sz = size(str)(2);
for i = 1:sz
  row = [row str(i)];
  if mod(i, 10) == 0
    img = [img; [row]];
    row = [];
  endif
endfor