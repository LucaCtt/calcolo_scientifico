% Esercizio matrice di Hilbert
n=10;
A=hilb(n);
K=cond(A); % K~1e-7 => enorme

% costruisco il termine noto b=A*[1;1;...]
b=A*ones(n,1);

% Stimo l'errore (eps/2=unità di randoff)
err_stimato=K*eps/2

% Risolvo il sistema lineare
x=meg(A,b)

err_reale=norm(x-ones(n,1))/norm(ones(n,1))