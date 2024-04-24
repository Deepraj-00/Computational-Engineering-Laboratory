% Define mass and stiffness matrices
m1 = 12000; m2 = 10000; m3 = 8000;
k1 = 3000; k2 = 2400; k3 = 1800;

M = diag([m1, m2, m3]); % Mass matrix
K = [k1 + k2, -k2, 0;
     -k2, k2 + k3, -k3;
     0, -k3, k3];        % Stiffness matrix

% Solve the eigenvalue problem
[V, D] = eig(K, M);

% Extract eigenvalues (D) and eigenvectors (V)
lambda = diag(D);

% Display eigenvalues
disp('Eigenvalues:');
disp(lambda);

% Display eigenvectors
disp('Eigenvectors:');
disp(V);
% Normalize eigenvectors
normalized_V = V ./ V(3, :);

% Plot amplitudes versus height for each eigenvector
figure;
heights = [1, 2, 3]; % Floor heights
for i = 1:size(V, 2)
    subplot(size(V, 2), 1, i);
    bar(heights, normalized_V(:, i));
    title(['Mode ', num2str(i)]);
    xlabel('Floor');
    ylabel('Normalized Amplitude');
    ylim([-1, 1]); % Adjust ylim as needed
end
