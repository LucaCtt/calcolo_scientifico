function [L,U,P]=fattorizzazionelu(A,pivot)
% fattorizzazionelu: clcolo la fatt. LU di A
% input: A = matrice quadrata non singolare
%        pivot=0 no pivotazione
%        pivot=1 si pivotazione
% output: L=matrice triangolare inferiore
%         U=matrice triangolare superiore t.c. A=LU
%         P=matrice delle permutazioni

[n,m]=size(A);
if n~=m
    disp("A non quadrata");
    return;
end

% Inizializzo la matrice P che memorizza gli scambi di righe
P=eye(n);

for k=1:n-1 % ciclo sul passo
    if pivot
        % pivotazione
        [~,r]=max(abs(A(k:n,k)));
        % r è la posizione relativamente al sottovettore che parte da riga k
        r=r+k-1; % posizione r all'interno della matrice
        % scambio le righe di A
        temp=A(k,:);
        A(k,:)=A(r,:);
        A(r,:)=temp;
        %scambio i termini noti
        temp=P(k,:);
        P(k,:)=P(r,:);
        P(r,:)=temp;
    end
    for i=k+1:n % ciclo sulle righe
        if A(k,k)==0
            disp("Termine diagonale nullo");
            return
        end

        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n % Ciclo sulle colonne di A
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end

U=triu(A); % Matrice triangolare superiore, il cui triangolo superiore contiene il triangolo superiore di A
L=tril(A,-1)+eye(n);
