clear
clc
% format long
            # X     Y|X
xsize = 2;  # c     f
ysize = 3;  # 1     c
X = round(10*rand(1,xsize));
PX = X/sum(X);
PYgX = [];

for i = [1:xsize]
  Yi = round(10*rand(1,ysize));
  PXgYi = Yi/sum(Yi);
  par_sum = sum(PXgYi);    % cada fila suma 1
  PYgX = [PYgX; PXgYi];
endfor

PYgX = [0.9 0.1; 0.2 0.8];
PX = [0.5 0.5];

PX
PYgX

# [P(Y)]
PY = PX*PYgX
PYsum = sum(PY);  % debe dar 1

# [P(X,Y)]
PXd = diag(PX);
PXY = PXd*PYgX
sum(sum(PXY));    % debe dar 1

# [H(X)]
HX = -sum(PX.*log2(PX))

# [H(Y)]
HY = -sum(PY.*log2(PY))

# [H(Y|X)] 
% si da NaN es porque alguna de las entradas en P(Y|X) es cero
HYgX = -sum(sum(PXY.*log2(PYgX)))

# [H(X,Y)]
HXY = -sum(sum(PXY.*log2(PXY)))

# [I(X;Y)]
IXY = HY - HYgX


