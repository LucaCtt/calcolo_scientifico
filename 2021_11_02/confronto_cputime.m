% La prima volta che lancio lo script i tempi non sono affidabili
% perchè devo caricare tutto in memoria.

load west0479; % Matrice integrata in Matlab, quasi interamente composta da 0
W=west0479;
clear west0479;
A=full(W);

x=rand(length(A),1);

% Formato pieno
tic
for i=1:1000
    % Qua vengono fatti anche tutti i prodotti con gli elementi nulli
    y=A*x;
end
toc

% Formato sparso
tic
for i=1:1000
    % Vengono fatti solo i prodotti con gli elementi != 0
    z=W*x;
end
toc