n=25;

if ~exist('X', 'var')
    X=[];
    k=round(sqrt(n));
    for ii=1:k
        for jj=1:k
            X(:,end+1)=[(ii-1)/(k); (jj-1)/(k-1)];
        end
    end
end

A_all = cat(3, ...
    eye(2), ...  % Identity
    [0 -1; 1 0], ...      % g1
    [-1 0; 0 -1], ...     % g1^2
    [0 1; -1 0], ...      % g1^3
    [-1 0; 0 -1], ...     % g2
    [-1 0; 0 -1], ...     % g3
    [0 -1; 1 0], ...      % g4
    [-1 0; 0 -1], ...     % g4^2
    [0 1; -1 0] ...       % g4^3
);

b_all = [ ...
    [0; 0], ...           % identity
    [0; 0], ...           % g1
    [0; 0], ...           % g1^2
    [0; 0], ...           % g1^3
    [2; 0], ...           % g2
    [0; 2], ...           % g3
    [2; 0], ...           % g4
    [2; 2], ...           % g4^2
    [0; 2] ...            % g4^3
];

D = zeros(n,n);

for ii=1:n
    for jj=1:n
        x = X(:,ii);
        y = X(:,jj);
        dist = [];
        for kk=1:9
            A = A_all(:,:,kk);
            b = b_all(:,kk);
            y_trans = A * y + b;
            dist(end+1) = norm(x - y_trans);
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

fprintf('After square root value is %f\n', sqrt(t));

fprintf('2*sqrt(2 - sqrt(2)) is %f\n', 2 * sqrt(2 - sqrt(2)));
