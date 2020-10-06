function [xq]=cuantUniforme(x,xmax,n)
% DESCRIPCI�N: cuantiza x sobre (-xmax,xmax) usando L = 2^n niveles.
% ENTRADAS: - x=se�al de entrada.
%                     - xmax=magnitud m�xima de la se�al a ser cuantizada. (me: pensar
%                       en volts. ver grafica 5-8)
%                     - n=n�mero de bits de cuantizaci�n. (me: numero de bits
%                       para representar la codificacion binaria, esto es, el 
%                       tamano de la palabra)
% SALIDAS: - xq=se�al cuantizada.

if (nargin~=3)
	disp('N�mero incorrecto de argumentos de entrada');
	return;
end
L=2^n;
Delta=(2*xmax)/L;
% las lineas q siguen hay q estudiarlas para entender la 'magia' de la
% cuantizacion jajaja
q=floor(L*((x+xmax)/(2*xmax)));  % q={...,-2,-1,0,1,2,...,L-1,L,L+1,...}
i=find(q>L-1); q(i)=L-1;         % q={...,-2,-1,0,1,2,...,L-1}
i=find(q<0); q(i)=0;             % q={0,1,2,...,L-1}
xq=(q*Delta)-xmax+(0.5*Delta);
