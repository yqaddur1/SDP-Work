n=36;

theta=2*pi*rand;

A = [ 1 0; cos(theta) sin(theta)]';

X=[];
k=round(sqrt(n));
for ii=1:k
    for jj=1:k
        X(:,end+1)=[ii-1; jj-1]/k;
    end
end

X = A*X;

G = [ -1 -1; -1 0; -1 1; 0 -1; 0 0; 0 1; 1 -1; 1 0; 1 1]';
G = A*G;

D = zeros(n,n);

for ii=1:n
    for jj=1:n
        x = X(:,ii);
        y = X(:,jj);
        dist = [];
        for kk=1:9
            g = G(:,kk);
            dist(end+1) = norm(x-(y+g));
        end
        D(ii,jj)=min(dist)^2;
    end
end

cvx_begin sdp
    variable Q(n,n)
    variable t
    minimize( t )
    subject to
        for ii=1:n
            for jj=1:n
                Q(ii,ii)-2*Q(ii,jj)+Q(jj,jj) >= D(ii,jj)
                Q(ii,ii)-2*Q(ii,jj)+Q(jj,jj) <= t*D(ii,jj)
            end
        end
        Q*ones(n,1) == 0
        Q >= 0
cvx_end

fprintf('After square root value is %f\n', sqrt(t))

fprintf('pi/2 is %f\n', pi/2)

