A=[10 4 3 -2; 2 20 20 -1; 3 -6 4 3; -3 0 3 1];
b=[5;24;13;-2];

% Fatt A con pivoting
[L,U,P]=fattorizzazionelu(A,1)

% P risulta essere la matrice identità => no pivotazione
% A non è ne a dominanza stretta ne def positiva

% Risolvo Ly=b
y=forsub(L,P*b);
% Risolvo Ux=y
x=backsub(U,y)

%%

A=[1 4 3 -2; 2 20 20 -1; 3 -6 4 3; -3 0 3 1];
b=[5;24;13;-2];

% Fatt A con pivoting
[L,U,P]=fattorizzazionelu(A,1)

% Qui avviene pivotazione

% Risolvo Ly=b
y=forsub(L,P*b);
% Risolvo Ux=y
x=backsub(U,y)