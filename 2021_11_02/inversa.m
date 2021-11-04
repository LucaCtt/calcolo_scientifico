function [A1]=inversa(A)
% inversa: A1=inversa(A) calcola la matrice inversa di A con la
% fattorizzazione LU.
% Input: A matrice quadrata invertibile
% [n,m]=size(A);

n=length(A);
A1=zeros(n);

% Fattorizzo A (con pivotazione)
[L,U,P]=fattorizzazionelu(A,1);

for j=1:n
    e=zeros(n,1);
    e(j)=1; % Elemento sulla diagonale principale = 1
    y=forsub(L, P*e);
    x=backsub(U,y); % Vettore colonna j-esimo di A1
    A1(:,j)=x;
end