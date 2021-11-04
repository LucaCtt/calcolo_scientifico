function [x]=forsub(L,b)
%forsub: forward substitution per risolvere Lx=b
%input: L=matrice quadrata triangolare inferiore
%       b=vettore colonna, termine noto
%output: vettore colonna soluzione
%x=forsub(L,b)

[n,m]=size(L);
[nb,mb]=size(b);
if n~=m || m~=nb
    disp("Matrice non quadrata o termine noto non compatibile con L");
    x=[];
    return;
end

x=zeros(n,1);
for i=1:n
    % Calcolo la sommatoria
    s=0;
    for j=1:i-1
        s=s+L(i,j)*x(j);
    end
    % s=L(i;1:i-1)*x(1:i-1) metodo più breve per fare la sommatoria
    x(i)=(b(i)-s)/L(i,i);
end
