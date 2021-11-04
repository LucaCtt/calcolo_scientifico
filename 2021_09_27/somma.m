function [s]=somma(a,b)
% Sommo due vettori colonna
% [s]=somma(a,b)
% Input: a,b: due vettori colonna della stessa dimensione
% Output: vettore somma

n=length(a); % massimo tra n righe e n colonne dell'argomento
s=zeros(n,1); % inizializzo un vettore s a zero

for j=1:n
    s(j)=a(j)+b(j);
end
disp('La somma è:'),s