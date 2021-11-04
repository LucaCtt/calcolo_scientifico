x=linspace(0.996, 1.004, 10000);

p1=(x-1).^6;
p2=x.^6-6*(x.^5)+15*(x.^4)-20*(x.^3)+15*(x.^2)-6*x+1;
p3=1+x.*(-6+x.*(15+x.*(-20+x.*(15+x.*(-6+x)))));

figure(1); clf
hold on
plot(x, p2, 'DisplayName', 'p2(x)')
plot(x, p3, 'DisplayName', 'p3(x)')
plot(x, p1, 'DisplayName', 'p1(x)')
legend('-dynamiclegend')
xlabel('x'); ylabel('y');
grid on
hold off

% Visto che sto lavorando con un polinomio di grado positivo mi aspetto
% che x sia sempre >= 0.
% Per via dell'errore in alcuni punti x va sotto lo 0.
% In questo caso l'errore è dovuto al fatto che sommo numeri con segno
% opposto e valore assoluto molto vicino -> Forti errori nella somma
% Questi errori sono detti di cancellazione.