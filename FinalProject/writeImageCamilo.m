clc
clear
str = strRandom(10000);
# str = strRep("abcdefghij", 1000);
writeImageFel(str);

# D1 = eye(1000);
# imwrite(mat2gray(D1(:,:,1)),'D1_concatderiv.jpg');