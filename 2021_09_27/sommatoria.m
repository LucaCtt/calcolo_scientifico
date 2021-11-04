function [s]=sommatoria(n)
% Sommatoria serie armonica
% s=sommatoria(n)
% Input: n: numero reale
% Output: s: sommatoria serie armonica fino a n

s=0;
for k=n:-1:1 % Meglio partire da n a 1, per sommare prima i contributi piccoli e poi quelli grandi
    s=s+(1/k);
end
fprintf('La somma è %8.6f\n', s);
