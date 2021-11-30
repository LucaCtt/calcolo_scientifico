function [isa,nodi] = simpsonad(f,a,b,tol,hmin)
% Formula di quadratura di Simpson composito
% Input: f=function handle
%        a,b=estremi dell'intervallo di integrazione
%        M=numero di intervallini
% Output: Is=valore approssimato dell'integrale

alpha=a;beta=b;isa=0;nodi=[];
while(beta-alpha)>0
    l1=simpson(f,alpha,beta,1);
    l2=simpson(f,alpha,beta,2);
    stim=1/15*abs(l1-l2);

    if stim > tol/2*(beta-alpha)/(b-a) && (beta-alpha)>hmin
        % Dimezzo l'intervallo attivo
        beta=(beta+alpha)/2
    else
        % Accetto I2 come approx
        isa=isa+l2;
        nodilocali=linspace(alpha,beta,5)
        nodi=[nodi,nodilocali]
        % Modifico [alpha,beta]
        alpha=beta;beta=b;
    end
end
nodi=unique(nodi)
