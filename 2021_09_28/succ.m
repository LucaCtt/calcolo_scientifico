function succ(N)
fn=zeros(N,1);
fn(2)=2;

for n=2:N-1
    fn(n+1)=2^(n-0.5)*sqrt(1-sqrt(1-4^(1-n)*fn(n)^2));
end

en=abs(fn-pi)/pi;
en(1)=0;

figure(1); clc
subplot(2,1,1); plot(1:N, fn, 'o')
xlabel('n'); ylabel('fn')
grid on

subplot(2,1,2); semilogy(1:N, en, 'o') % Perchè ho valori molto piccoli
xlabel('n'); ylabel('en')
grid on

% Gli errori sono dovuti alle sottrazioni: quando n cresce, nella radice
% ottengo 1 - un valore molto vicino a 1