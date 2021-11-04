function [x]=meg_pivot(A,b)
% meg_pivot: risoluzione di Ax=b con metodo di eliminazione di Gauss
% input: A = matrice quadrata non singolare
%        b = vettore colonna, termine noto del sistema
% output: x= vettore soluzione
% x=meg_pivot(A,b)

x=[];

[n,m]=size(A);
if n~=m
    disp("A non quadrata");
    return;
end

[nb,mb]=size(b);
if nb~=n
    disp("b non compatibile con A");
    return;
end

for k=1:n-1 % ciclo sul passo
    % pivotazione per righe
    [~,r]=max(abs(A(k:n,k)));
    % r è la posizione relativamente al sottovettore che parte da riga k
    r=r+k-1; % posizione r all'interno della matrice
    % scambio le righe di A
    temp=A(k,:);
    A(k,:)=A(r,:);
    A(r,:)=temp;
    %scambio i termini noti
    temp=b(k);
    b(k)=b(r);
    b(r)=temp;
    % fine della pivotazione
    
    for i=k+1:n % ciclo sulle righe
        if A(k,k)==0
            disp("Termine diagonale nullo");
            return
        end
        mik=A(i,k)/A(k,k);
        for j=k+1:n % Ciclo sulle colonne di A
            A(i,j)=A(i,j)-mik*A(k,j);
        end
        b(i)=b(i)-mik*b(k); % Aggiornamento termine noto
    end
end
U=triu(A); % Matrice triangolare superiore, il cui triangolo superiore contiene il triangolo superiore di A

% Richiamo backsub
x=backsub(U,b);
