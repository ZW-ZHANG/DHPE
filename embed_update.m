function [nU nS nV nA nB] = embed_update(detA , U, S, V, mA, mB)
%U,V n*k 
%S k*k  
%A = I-b*A
%B = b*A
%l*A*U = BU
%detA = the changed edges
%detB = -detA
%mA = Fa in paper
%mB = Fb in paper

%get eigenvalues
%calc l = sign * S
if (sum(isnan(S)) > 0)
    error('bug S');
end
K = size(S,1);
N = size(U,1);
nU = U;
SN = ones(K,1);
for i=1:K
    for j = 1:N
        if (V(j,i) ~= 0)
            SN(i) = sign(U(j,i)/V(j,i));
            break;
        end
    end
end
l = diag(S) .* SN;
if (sum(isnan(l)) > 0)
    error('bug l');
end

%calc detl
dA = U'*detA*U; 
detl = zeros(K,1);
%fm1 = diag(mA)
%fm2 = diag(dA)
for i = 1:K
    detl(i) = -(l(i)+1)*dA(i,i)/(mA(i,i)+dA(i,i));
end
%detl
%diag(mA)
%calc new U 
%tB=U'*U-mA;
%errB = sum(sum((mB - tB).^2))
F = zeros(K,K);
for i =1:K
    S = zeros(K,K);
    B = zeros(K,1);
    for p = 1:K
        if (p ~= i)
            B(p) = -(l(i)+detl(i)+1)*dA(p,i)-(detl(i)*mA(p,i));
            for q = 1:K
                S(p,q) = (l(i)+detl(i)+1)*dA(p,q) + (l(i)+detl(i))*mA(p,q) - mB(p,q);
            end
        else
            B(p) = 0;
            S(p,p) = 1;
        end
    end
    %g = S\B;
    g = pinv(S)*B;
    for j = 1:K
        nU(:,i) = nU(:,i) + g(j)*U(:,j);
        F(j,i) = g(j);
    end
    F(i,i) = F(i,i) + 1;
end

for i = 1:K
    xs = sqrt(sum(nU(:,i).^2));
    nU(:,i) = nU(:,i) / xs;
    F(:,i) = F(:,i) / xs;
end

nA = zeros(K,K);
nB = zeros(K,K);
%calc new X'MaX (new Fa and Fb in paper)
for i =1:K
    for j =1:K
        for p =1:K
            for q =1:K
                nA(i,j) = nA(i,j) + F(p,i)*F(q,j)*mA(p,q);
                nB(i,j) = nB(i,j) + F(p,i)*F(q,j)*mB(p,q);
            end
        end
    end
end

nS = diag(abs(l+detl));
%diag(sign(l+detl))
nV = nU * diag(sign(l+detl));
end

