% Risolvo con la fattorizzazione di Cholesky

A=[6 1 -2 2 1;
   1 3 1 -2 0;
   -2 1 4 -1 -1;
   2 -2 -1 4 2;
   1 0 -1 2 3;];

% Voglio trasformare A in formato sparso, memorizzando solo il triangolo
% superiore
AT=triu(A); % Sempre in formato pieno
A=sparse(AT); % Triangolo sup di A in formato sparso

b=[15;2;3;21;21];

% Funziona senza problemi perchè usa solo il triangolo superiore!
R=chol(A);

% Risolvo il sistema triangolare inferiore R'y=b
y=forsub(R',b);
% Risolvo il sistema triangolare superiore Rx=y
x=backsub(R,y)

