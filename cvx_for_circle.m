k=60;

X=[];
for ii=1:k
    X(end+1)=(ii-1)/k;
end

G = [ -1; 0; 1]';

D = zeros(k,k);

for ii=1:k
    for jj=1:k
        x = X(ii);
        y = X(jj);
        dist = [];
        for kk=1:3
            g = G(:,kk);
            dist(end+1) = norm(x-(y+g));
        end
        D(ii,jj)=min(dist)^2;
    end
end

cvx_begin sdp
    variable Q(k,k)
    variable t
    minimize( t )
    subject to
        for ii=1:k
            for jj=1:k
                Q(ii,ii)-2*Q(ii,jj)+Q(jj,jj) >= D(ii,jj)
                Q(ii,ii)-2*Q(ii,jj)+Q(jj,jj) <= t*D(ii,jj)
            end
        end
        Q*ones(k,1) == 0
        Q >= 0
cvx_end

fprintf('After square root value is %f\n', sqrt(t))

fprintf('pi/2 is %f\n', pi/2)