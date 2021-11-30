% Leggo l'immagine trecolori.png
% Matrice a 3 indici 150x160x3
% == sequenza di tre matrici, rettangolari, 150x160
% In ognuna di queste matrici vengono mantenute
% le info relative ai colori RGB

% A=imread("trecolori","png");
A=imread("mozilla-logo-800","png");

% Visualizzo il contenuto di A
figure(1); clf
image(A)
title("Immagine originale")

% Converto i dati in double
[n,m,dim]=size(A);
R=double(A(:,:,1));
G=double(A(:,:,2));
B=double(A(:,:,3));

% Nota: nei grafici le immagini sono "flippate" rispetto all'asse y,
% perchè nelle immagini l'ordine va dal valore più alto di y a 0.
% Nei grafici invece è il contrario
figure(2); clf
mesh(R)
xlabel("x");ylabel("y");title("Red")

figure(3); clf
mesh(G)
xlabel("x");ylabel("y");title("Green")

figure(4); clf
mesh(B)
xlabel("x");ylabel("y");title("Blue")

% Interpreto l'intensità di colore come funzione.
% Per trovare la linea di contorno di una figura
% individuo i punti della mesh in cui le derivate
% parziali sono molto grandi.
%
% Non conosco l'espressione analitica delle funzioni:
% devo usare le approssimazioni con le matrici a differenze finite.

% Genero le matrici delle differenze finite centrate lungo e lungo y

% DX è una matrice mxm
e=0.5*ones(m,1); % h=1, distanza tra pixel
DX=spdiags([-e,e],[-1,1],m,m);

% DY è una matrice nxn
e=0.5*ones(n,1);
DY=spdiags([-e,e],[-1,1],n,n);

% Definisco una nuova funzione che è la media delle intensità di colore dei
% tre colori RGB.
Z=(R+B+G)/3;

% Calcolo le derivate parziali di Z
DXZ=Z*DX';
DYZ=DY*Z;

% Norma del gradiente pixel per pixel
norma_gradiente=sqrt(DXZ.^2+DYZ.^2);
figure(5); clf
mesh(norma_gradiente)

% Calcolo il valore medio del gradiente
% Sommo prima le colonne, poi devo sommare le righe
valore_medio=sum(sum(norma_gradiente))/(n*m);

% Inizializzo una nuova matrice, con tutti elementi = colore bianco
edge=255*uint8(ones(n,m));

% Se |grad|>2*valore medio modifico il pixel da bianco a nero
for i=1:n
    for j=1:m
        if norma_gradiente(i,j)>2*valore_medio
            edge(i,j)=0;
        end
    end
end

figure(6); clf
image(edge)
colormap(gray(256))