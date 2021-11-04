function [c]=prodotto(a,b)
[n,ma]=size(a);
[nb,p]=size(b);

if ma~=nb
    error('Il numero di colonne di a è diverso dal numero di righe di b');
else
    c=zeros(n,p);
    for i=1:n
        for j=1:p
            for k=1:ma
                c(i,j)=c(i,j)+a(i,k)*b(k,j);
            end
        end
    end
end

end % Obbligatorio solo se ho più function nello stesso file