[Vectors, EigenValues] = eig(Q);  % Compute eigenvalues and eigenvectors
EigenValues = diag(EigenValues);  % Extract eigenvalues into a vector

% Find the indices of the top three largest eigenvalues
[~, idx] = sort(real(EigenValues), 'descend');  % Sort eigenvalues in descending order
top_indices = idx(1:3);  % Get indices of the top 3 eigenvalues

eigenvalues = sort(real(EigenValues), 'descend');
fprintf('Top 8 eigenvalues of Q:\n');
disp(eigenvalues(1:8));

% Get the top three eigenvectors
topEigenvectors = Vectors(:, top_indices);  % This will have three columns

% Extract each eigenvector
eigenvector1 = topEigenvectors(:, 1);
eigenvector2 = topEigenvectors(:, 2);
eigenvector3 = topEigenvectors(:, 3);

% (Optional) Normalize if needed
% eigenvector1 = eigenvector1 / norm(eigenvector1);
% eigenvector2 = eigenvector2 / norm(eigenvector2);
% eigenvector3 = eigenvector3 / norm(eigenvector3);

% Create a 3D scatter plot
figure;

scatter3(eigenvector1, ...
         eigenvector2, ...
         eigenvector3, ...
         36, 'filled');
hold on;

% Add labels for each point
n = length(eigenvector1);  % Assuming n x 1 eigenvectors
for i = 1:n
    text(eigenvector1(i), ...
         eigenvector2(i), ...
         eigenvector3(i), ...
         sprintf('%d', i), ...
         'FontSize', 8, 'Color', 'k', 'HorizontalAlignment', 'center');
end

% Configure the plot
axis equal;
xlabel('1st Principal Direction');
ylabel('2nd Principal Direction');
zlabel('3rd Principal Direction');
title('Top Three Eigenvectors of Gram Matrix Q (3D)');
grid on;
view(30, 30);  % Adjust 3D view angle