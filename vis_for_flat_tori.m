[Vectors, EigenValues] = eig(Q);  % Compute eigenvalues and eigenvectors
EigenValues = diag(EigenValues);   % Extract eigenvalues into a vector

% Find the indices of the top two largest eigenvalues
[~, idx] = sort(real(EigenValues), 'descend');  % Sort eigenvalues in descending order
top_indices = idx(1:2);  % Get indices of the top two eigenvalues

% Get the top two eigenvectors
topEigenvectors = Vectors(:, top_indices);  % This will have two columns

% Print the top two eigenvectors
%disp('Top Two Eigenvectors of Gram Matrix Q:');
%disp(topEigenvectors);

% Assuming topEigenvectors is your n x 2 matrix containing the top two eigenvectors
% Extract the two eigenvectors
eigenvector1 = topEigenvectors(:, 1);  % First eigenvector
eigenvector2 = topEigenvectors(:, 2);  % Second eigenvector

% Normalize the eigenvectors for better visualization (optional)
eigenvector1_normalized = eigenvector1;% / norm(eigenvector1);
eigenvector2_normalized = eigenvector2;% / norm(eigenvector2);

% Create a 2D plot
figure;

% Scatter plot of the two eigenvectors
scatter(eigenvector1_normalized, ...
        eigenvector2_normalized, ...
        'filled');

% Configure the plot
axis equal;
xlim([-1 1]);
ylim([-1 1]);
xlabel('X-axis');
ylabel('Y-axis');
title('Top Two Eigenvectors of Gram Matrix Q');
grid on;

% Annotate points for clarity
%text(eigenvector1_normalized(1), eigenvector1_normalized(2), '  Eigenvector 1', 'Color', 'b');
%text(eigenvector2_normalized(1), eigenvector2_normalized(2), '  Eigenvector 2', 'Color', 'g');

% Optionally add a marker for the origin
%scatter(0, 0, 'ro', 'filled'); % Origin point