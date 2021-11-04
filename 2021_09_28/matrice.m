% Il rango della matrice è 100 e gli autovalori sono tutti positivi, ma il
% determinante risulta essere 0 secondo Matlab (???)

load('matriceB.mat');
v=eig(B);
p=1;
for n=1:100
   p=p*v(n);
   %24 cifre per il numero nel suo intero, 16 per parte exp, 8 parte
   %intera
   fprintf('Prodotto al passo %d: %24.16e \n', n, p); 
end

% Moltiplicando per valori di 1 il risultato diventa sempre più piccolo.
% Dopo il passo 86 in cui ho p=2e-320 ottengo un underflow.
% In realtà questo valore di p è sotto realmin: Matlab supporta anche
% numeri sotto il realmin, però tali numeri non rispettano le regole
% dell'IEEE.