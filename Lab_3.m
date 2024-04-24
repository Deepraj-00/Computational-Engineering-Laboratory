% Define constants
k1 = 10;   % N/m
k2 = 30;   % N/m
k3 = 30;   % N/m
k4 = 10;   % N/m
m1 = 1;    % kg
m2 = 1;    % kg
m3 = 1;    % kg
x1 = 0.05; % m
x2 = 0.04; % m
x3 = 0.03; % m

% Construct the coefficient matrix [A] and right-hand side vector [B]
A = [m1, 0, 0; -k1, k1 + k2, -k2; 0, -k2, k2 + k3];
B = [-k1 * x1; k2 * (x2 - x1); k3 * (x3 - x2)];

% Solve for accelerations using matrix inversion
accelerations = A \ B;

% Display the accelerations
a1 = accelerations(1);
a2 = accelerations(2);
a3 = accelerations(3);

fprintf('Acceleration of mass 1 (a1) = %.4f m/s^2\n', a1);
fprintf('Acceleration of mass 2 (a2) = %.4f m/s^2\n', a2);
fprintf('Acceleration of mass 3 (a3) = %.4f m/s^2\n', a3);
