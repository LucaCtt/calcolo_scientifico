function [x]=backsub(U,b)
%forsub: backward substitution per risolvere Ux=b
%input: U=matrice quadrata triangolare superiore
%       b=vettore colonna, termine noto
%output: vettore colonna soluzione
%x=backsub(U,b)

[n,m]=size(U);
[nb,mb]=size(b);
if n~=m || m~=nb
    disp("Matrice non quadrata o termine noto non compatibile con U");
    x=[];
    return;
end

x=zeros(n,1);
for i=n:-1:1
    % Calcolo la sommatoria
    s=0;
    for j=i+1:n
        s=s+U(i,j)*x(j);
    end
    x(i)=(b(i)-s)/U(i,i);
end
