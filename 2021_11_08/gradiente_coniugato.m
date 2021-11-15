function [x,res,k,resv]=gradiente_coniugato(A,b,x0,tol,kmax)
% metodo del gradiente coniugato per risolvere Ax=b
% [x,res,k,resv]=gradiente_coniugato(A,b,x0,tol,kmax)
% Input: A, matrice quadrata simmetrica e def positiva
%        b = t. noto (vettore colonna)
%        x0 = vettore colonna del dato iniziale
%        tol, kmax, = tolleranza e n. max di iterazioni per test d'arresto
% Output: x = soluzione calcolata
%         res =||r^(k)||/||b|| all'ultima iterazione
%         k =  numero di iterazioni svolte
%         resv = vettore dei res

x=x0;
r=b-A*x; d=r;
k=0; res=tol+1;
normab=norm(b);
resv=res; % vettore dei residui

while k<=kmax && res>tol
  v=A*d;
  alpha=(d'*r)/(d'*v);
  x=x+alpha*d;
  r=r-alpha*v;
  % aggiungo il calcolo della nuova direzione di discesa
  beta=(v'*r)/(d'*v);
  d=r-beta*d;
  res=norm(r)/normab;
  resv=[resv;res];
  k=k+1;
end