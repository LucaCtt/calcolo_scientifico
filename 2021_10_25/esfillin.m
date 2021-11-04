% Costruisco la matrice A
A=3*eye(10);
A(1,:)=1;
A(:,1)=1;

figure(1); clf
spy(A)
title("A")

[L,U,P]=fattorizzazionelu(A,1);

figure(2); clf
spy(L)
title("L")

figure(3); clf
spy(U)
title("U")

% Sia L che U hanno quasi interamente riempito il loro triangolo, anche se
% A ha molti elementi uguali a 0.
% Questo fenomeno è detto fill-in e potrebbe creare dei problemi di memoria
% Per questa ragione quando ho dei sistemi lineari molto grandi i metodi
% diretti non vengono usati.

%%
% Costruisco la matrice A
A=3*eye(10);
A(10,:)=1;
A(:,10)=1;

figure(1); clf
spy(A)
title("A")

[L,U,P]=fattorizzazionelu(A,1);

figure(2); clf
spy(L)
title("L")

figure(3); clf
spy(U)
title("U")

% Inverto la prima riga con l'ultima e la prima colonna con l'ultima;
% Questo caso invece è molto favorevole