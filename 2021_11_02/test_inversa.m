A=[10 4 3 -2;2 20 20 -1;3 -6 4 3;-3 0 3 1];

A1=inversa(A)
A1matlab=inv(A)

% Ricorda che calcolare la matrice inversa è inefficiente, molto meglio
% risolvere il sistema lineare Ax=b piuttosto che x=(Ae-1)b